local status, ts = pcall(require, 'nvim-treesitter.configs')
if (not status) then return end

ts.setup {
  highlight = {
    enable = true,
    diable = {},
  },
  indent = {
    enable = true,
    disable = {},
  },
  ensure_installed = {
    'typescript',
    'tsx',https://typescriptbook.jp/overview/before-typescript
    'lua',
    'json',
    'css'
  },
  autotag = {
    enable = true,
  }
}
