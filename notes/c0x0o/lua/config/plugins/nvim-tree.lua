local function setup()
    vim.g.nvim_tree_git_hl = 1 -- 0 by default, will enable file highlight for git attributes (can be used without the icons).
    vim.g.nvim_tree_highlight_opened_files = 1 -- 0 by default, will enable folder and file icon highlight for opened files/directories.
    vim.g.nvim_tree_root_folder_modifier = ':~' -- This is the default. See :help filename-modifiers for more options
    vim.g.nvim_tree_add_trailing = 1 -- 0 by default, append a trailing slash to folder names
    vim.g.nvim_tree_group_empty = 1 -- 0 by default, compact folders that only contain a single folder into one node in the file tree
    vim.g.nvim_tree_icon_padding = ' ' -- one space by default, used for rendering the space between the icon and the filename. Use with caution, it could break rendering if you set an empty string depending on your font.
    -- Dictionary of buffer option names mapped to a list of option values that
    -- indicates to the window picker that the buffer's window should not be
    -- selectable.
    vim.g.nvim_tree_special_files = { 'README.md', 'Makefile', 'MAKEFILE', 'Cargo.toml' } -- List of filenames that gets highlighted with NvimTreeSpecialFile
    vim.g.nvim_tree_show_icons = {
        git = 1,
        folders = 1,
        files = 1,
        folder_arrows = 1,
    }

    --If 0, do not show the icons for one of 'git' 'folder' and 'files'
    --1 by default, notice that if 'files' is 1, it will only display
    --if nvim-web-devicons is installed and on your runtimepath.
    --if folder is 1, you can also tell folder_arrows 1 to show small arrows next to the folder icons.
    --but this will not work when you set indent_markers (because of UI conflict)

    -- default will show icon by default if no icon is provided
    -- default shows no icon by default
    vim.g.nvim_tree_icons = {
        default = '',
        symlink = '',
        git = {
            unstaged = '*',
            staged = '✓',
            unmerged = '',
            renamed = '➜',
            untracked = '+',
            deleted = '-',
            ignored = '◌'
        },
        folder = {
            arrow_open = '',
            arrow_closed = '',
            default = '',
            open = '',
            empty = '',
            empty_open = '',
            symlink = '',
            symlink_open = '',
        },
        lsp = {
            hint = '',
            info = '',
            warning = '',
            error = '',
        }
    }

    require'nvim-tree'.setup {
        disable_netrw = true,  -- 1 by default, disables netrw
        hijack_netrw = true, -- 1 by default, prevents netrw from automatically opening when opening directories (but lets you keep its other utilities)
        open_on_setup = false, -- 0 by default, opens the tree when typing `vim $DIR` or `vim`
        open_on_tab = false, -- 0 by default, will open the tree when entering a new tab and the tree was previously open
        hijack_cursor = false, -- 1 by default, when moving cursor in the tree, will position the cursor at the start of the file on the current line
        diagnostics = {
            enable = true,
            icons = {
                hint = '',
                info = '',
                warning = '',
                error = ''
            }
        },
        update_cwd = true, -- 1 by default, will update the tree cwd when changing nvim's directory (DirChanged event). Behaves strangely with autochdir set.
        -- hijacks new directory buffers when they are opened.
        ignore_ft_on_setup = { 'startify', 'dashboard', 'DiffviewFiles', 'terminal' }, -- empty by default, don't auto open tree on specific filetypes.
        update_focused_file = {
            enable = false, -- 0 by default, this option allows the cursor to be updated when entering a buffer
            update_cwd = true, -- 1 by default, will update the tree cwd when changing nvim's directory (DirChanged event). Behaves strangely with autochdir set.
            ignore_list = {}
        },
        view = {
            side = 'left', -- left by default
            width = 40, -- 30 by default
            auto_resize = true
        },
        filters = {
            dotfiles = false,
            custom = { '.git', 'node_modules', '.cache' }
        },
        git = {
            enable = true,
            ignore = false,
            timeout = 500,
        },
        renderer = {
            indent_markers = {
                enable = true,
            },
        },
        actions = {
            change_dir = {
                global = false,
            },
            open_file = {
                quit_on_open = true,
                window_picker = {
                    enable = true,
                    exclude = {
                        filetype = {
                            'packer',
                            'qf'
                        },
                        buftype = {
                            'terminal'
                        }
                    },
                },
            },
        },
    }

    vim.api.nvim_set_keymap('n', '<leader>t', ':NvimTreeToggle<CR>', { noremap = true, silent = true})
end

return {
    setup = setup,
}
