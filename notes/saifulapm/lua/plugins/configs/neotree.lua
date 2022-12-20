local u = require 'utils.color'
u.overwrite {
  { 'NeoTreeIndentMarker', { link = 'Comment' } },
  -- { 'NeoTreeNormal', { link = 'PanelBackground' } },
  -- { 'NeoTreeNormalNC', { link = 'PanelBackground' } },
  { 'NeoTreeRootName', { bold = true, italic = true, foreground = 'LightMagenta' } },
  { 'NeoTreeCursorLine', { link = 'Visual' } },
}
vim.g.neo_tree_remove_legacy_commands = 1
vim.keymap.set('n', '<C-n>', '<Cmd>Neotree toggle reveal<CR>')
local icons = G.style.icons
require('neo-tree').setup {
  enable_git_status = true,
  git_status_async = true,
  event_handlers = {
    {
      event = 'neo_tree_buffer_enter',
      handler = function()
        vim.cmd 'setlocal signcolumn=no'
        vim.cmd 'highlight! Cursor blend=100'
      end,
    },
    {
      event = 'neo_tree_buffer_leave',
      handler = function()
        vim.cmd 'highlight! Cursor blend=0'
      end,
    },
  },
  filesystem = {
    hijack_netrw_behavior = 'open_current',
    filtered_items = {
      hide_dotfiles = false,
      hide_gitignored = false,
    },
  },
  default_component_configs = {
    git_status = {
      symbols = {
        added = icons.git.add,
        deleted = icons.git.remove,
        modified = icons.git.mod,
        renamed = icons.git.rename,
        untracked = '',
        ignored = '',
        unstaged = '',
        staged = '',
        conflict = '',
      },
    },
  },
  window = {
    position = 'right',
    width = 30,
    mappings = {
      o = 'toggle_node',
      ['<c-s>'] = 'open_split',
      ['<c-v>'] = 'open_vsplit',
    },
  },
}
