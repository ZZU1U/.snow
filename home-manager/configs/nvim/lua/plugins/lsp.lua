return {
  "neovim/nvim-lspconfig",
  ---@class PluginLspOpts
  opts = {
    ---@type lspconfig.options
    servers = {
      -- There's no extra for it so it should be installed through lsp
      tinymist = {},
    },
  },
}
