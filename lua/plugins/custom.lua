return {
    dir = '~/.config/nvim/own_plugins/hartoon',
    dependencies = {
        'nvim-lua/plenary.nvim',
        'nvim-telescope/telescope.nvim',
        'nvim-telescope/telescope-fzf-native.nvim',
    },
    init = function()
        vim.opt.rtp:append(vim.fn.stdpath('config') .. '/own_plugins')
    end,
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