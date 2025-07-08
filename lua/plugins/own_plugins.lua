return {
    {
        -- A Harpoon-inspired Neovim plugin for managing and jumping to your favorite tmux 
        -- sessions, with Telescope integration and an editable popup UI.
        -- * Pin the current tmux session to a persistent list
        -- * Edit pinned sessions in a floating, editable popup window
        -- * Jump to any pinned session with a single function or keymap
        -- * Telescope picker for all tmux sessions
        -- * All actions use direct tmux commands to switch sessions

        -- 'RaphaeleL/hartoon.nvim',
        dir = '~/.config/nvim/own_plugins/hartoon.nvim',
        dependencies = {
            'nvim-telescope/telescope.nvim',
        },
        lazy = true,
        config = function()
            require('hartoon').setup()
        end,
        keys = {
            { '<leader>ht', '<cmd>HartoonTmuxSessions<cr>', desc = 'List tmux sessions' },
            { '<leader>hta', '<cmd>HartoonPinTmuxSession<cr>', desc = 'Pin current tmux session' },
            { '<leader>htm', '<cmd>HartoonEditPinnedTmux<cr>', desc = 'Edit pinned tmux sessions' },
            { '<leader>ta', '<cmd>HartoonJumpTo1<cr>', desc = 'Jump to pinned tmux session 1' },
            { '<leader>ts', '<cmd>HartoonJumpTo2<cr>', desc = 'Jump to pinned tmux session 2' },
            { '<leader>td', '<cmd>HartoonJumpTo3<cr>', desc = 'Jump to pinned tmux session 3' },
        },
    }
}
