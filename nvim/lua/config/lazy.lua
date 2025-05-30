require("lazy").setup({
  -- Import plugin configurations
  { import = "plugins" },
}, {
  install = {
    colorscheme = { "tokyonight" },
  },
  checker = {
    enabled = true,
  },
})
