-- highlight on yank
vim.api.nvim_create_autocmd("TextYankPost", {
  group = vim.api.nvim_create_augroup("nvim_custom_highlight_yank", { clear = true }),
  callback = function()
    (vim.hl or vim.highlight).on_yank()
  end,
})

local nmap = function(bufnr, keys, func, desc)
  if desc then
    desc = "LSP: " .. desc
  end
  vim.keymap.set("n", keys, func, { buffer = bufnr, desc = desc, noremap = true, silent = true })
end

-- setup terminal
local floaterminal = require("utils.floaterminal")

vim.api.nvim_create_user_command("Floaterminal", floaterminal.toggle_terminal, {})

vim.api.nvim_create_autocmd('TermOpen', {
  group = vim.api.nvim_create_augroup("nvim_custom_terminal", { clear = true }),
  callback = function()
    vim.opt.number = false
    vim.opt.relativenumber = false
  end
})

-- set keymaps for LSP
vim.api.nvim_create_autocmd("LspAttach", {
  group = vim.api.nvim_create_augroup("UserLspConfig", {}),
  callback = function(ev)
    local client = vim.lsp.get_client_by_id(ev.data.client_id)
    if not client then
      print("No LSP client !")
      return
    end

    nmap(ev.bufnr, "K", vim.lsp.buf.hover, "Hover Documentation")
    nmap(ev.bufnr, "<leader>k", vim.lsp.buf.signature_help, "Signature Documentation")

    nmap(ev.bufnr, "<leader>rn", vim.lsp.buf.rename, "[R]e[n]ame")
    nmap(ev.bufnr, "<leader>ca", vim.lsp.buf.code_action, "[C]ode [A]ction")
    nmap(ev.bufnr, "<leader>cd", vim.diagnostic.setqflist, "[C]ode [D]iagnostic")
    nmap(ev.bufnr, "<leader>ld", vim.diagnostic.open_float, "[L]ine [D]iagnostic")
    nmap(ev.bufnr, "<leader>cc", vim.lsp.codelens.run, "Run [C]odelens")
    nmap(ev.bufnr, "<leader>cC", vim.lsp.codelens.refresh, "Refresh & Display [C]odelens")

    nmap(ev.bufnr, "gD", vim.lsp.buf.declaration, "[G]oto [D]eclaration")
    nmap(ev.bufnr, "gd", require("telescope.builtin").lsp_definitions, "[G]oto [D]efinition")
    nmap(ev.bufnr, "gr", require("telescope.builtin").lsp_references, "[G]oto [R]eferences")
    nmap(ev.bufnr, "gI", require("telescope.builtin").lsp_implementations, "[G]oto [I]mplementation")
    nmap(ev.bufnr, "<leader>D", require("telescope.builtin").lsp_type_definitions, "Type [D]efinition")
    nmap(ev.bufnr, "<leader>ds", require("telescope.builtin").lsp_document_symbols, "[D]ocument [S]ymbols")
    nmap(ev.bufnr, "<leader>ws", require("telescope.builtin").lsp_dynamic_workspace_symbols, "[W]orkspace [S]ymbols")

    if client.supports_method("textDocument/formatting") then
      -- format the current buffer on save
      vim.api.nvim_create_autocmd("BufWritePre", {
        buffer = ev.buf,
        callback = function()
          vim.lsp.buf.format({ bufrn = ev.buf, id = client.id })
        end,
      })
    end
  end,
})
