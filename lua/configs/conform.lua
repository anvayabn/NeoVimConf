local options = {
  formatters_by_ft = {
    lua = { "stylua" },

    python = { "isort", "black" },
  },

  format_on_save = {
    -- These options will be passed to conform.format()
    timeout_ms = 500,
    lsp_fallback = true,
  },
}

vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = "*",
  callback = function(args)
    require("conform").format({
      bufnr = args.buf,
      timeout_ms = options.format_on_save.timeout_ms,
      lsp_fallback = options.format_on_save.lsp_fallback,
    })
  end,
})

require("conform").setup(options)
