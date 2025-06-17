return {
  "sylvanfranklin/omni-preview.nvim",
  dependencies = {
    "chomosuke/typst-preview.nvim",
    "hat0uma/csvview.nvim",
  },
  opts = {},
  keys = {
    { "<leader>po", "<cmd>OmniPreview start<CR>", desc = "OmniPreview Start" },
    { "<leader>pc", "<cmd>OmniPreview stop<CR>", desc = "OmniPreview Stop" },
  },
}
