--  General settings
local opt = vim.opt
local g   = vim.g     -- global variables

opt.compatible = false

-- filetype detection
vim.cmd('filetype off')         -- required before setting up plugins

opt.termguicolors = true        -- enable true‑color support
-- vim.cmd('colorscheme sorbet')
-- vim.cmd('colorscheme unokai')
-- vim.cmd('colorscheme slate')
vim.cmd('colorscheme zaibatsu')
-- vim.cmd('colorscheme desert')

opt.syntax = 'on'
opt.hlsearch = true         -- highlight matches
opt.incsearch = true        -- search while typing

-- highlight last inserted text
vim.keymap.set('n', 'gV', '`[v`]')

-- search in subfolders (works with tab‑completion)
opt.path:append('**')

-- visual autocomplete for command menu
opt.wildmenu = true
opt.wildignore:append { '*/tmp/*', '*.so', '*.swp',
                        '*/vendor/*', '*.o', '*.pyc',
                        '*/tags/*', '*.log', '*.zip',
                        '*/.git/*' }

-- new vertical splits open to the right
opt.splitright = true

-- jump to first open window that contains buffer
opt.switchbuf:append {'useopen', 'vsplit'}


--  netrw (built‑in file explorer)
g.netrw_banner = 0          -- hide banner
g.netrw_liststyle = 3       -- tree view
g.netrw_browse_split = 2    -- open in previous window
g.netrw_winsize = 15        -- size of the netrw window

--  Broot (external file browser)
g.broot_default_conf_path = vim.fn.expand('~/.config/broot/conf.hjson')

--  indentation
opt.expandtab = true          -- use spaces instead of tabs
opt.tabstop = 2               -- number of spaces a <Tab> counts for
opt.shiftwidth = 2            -- indentation width


--  leader key
vim.g.mapleader = ','

--  Key Mappings
local map = vim.keymap.set

-- alternative to Esc
-- in Lisp it is used for comments!
map('i', ';;', '<Esc>', { noremap = true, silent = true })


-- One‑key leader shortcuts
map('n', '<leader><Space>', ':nohlsearch<CR>',   { noremap = true, silent = true })
map('n', '<leader>n', ':Vexplore<CR>',         { noremap = true, silent = true })
map('n', '<leader>m', ':make<CR>',             { noremap = true, silent = true })
map('n', '<leader>r', ':Rg<Space>',            { noremap = true, silent = true })
map('n', '<leader>b', ':buffers!<CR>:buffer<Space>', { noremap = true, silent = true })
-- toggle QuickFix
map('n', '<leader>c', ':cw<CR>',               { noremap = true, silent = true })
map('n', '<leader>h', ':help ',                { noremap = true, silent = true })

-- close terminal window
map('t', '<leader>q', "<C-w>:q!<CR>",         { noremap = true, silent = true })
map('n', '<leader>q', '<C-\\><C-n>:q!<CR>',   { noremap = true, silent = true })


-- Two‑key leader shortcuts
map('n', '<leader>eh', ':Broot<CR>',            { noremap = true, silent = true })
map('n', '<leader>ev', ':Broot vsplit<CR>',     { noremap = true, silent = true })

-- Quickfix list
map('n', '<leader>co', ':copen<CR>',     { noremap = true, silent = true })
map('n', '<leader>cc', ':cclose<CR>',    { noremap = true, silent = true })
map('n', '<leader>cn', ':cnext<CR>',     { noremap = true, silent = true })
map('n', '<leader>cp', ':cprevious<CR>', { noremap = true, silent = true })

-- Location list
map('n', '<leader>lo', ':lopen<CR>',     { noremap = true, silent = true })
map('n', '<leader>lc', ':lclose<CR>',    { noremap = true, silent = true })
map('n', '<leader>ln', ':lnext<CR>',     { noremap = true, silent = true })
map('n', '<leader>lp', ':lprevious<CR>', { noremap = true, silent = true })

-- Help window
map('n', '<leader>hc', ':helpclose<CR>', { noremap = true, silent = true })


-- FZF (fuzzy file finder)
map('n', '<C-p>', ':FZF<CR>', { noremap = true, silent = true })


-- Save / quit shortcuts
map('n', '<C-S>', ':w<CR>',  { noremap = true, silent = true })
map('n', '<C-Q>', ':wq<CR>', { noremap = true, silent = true })

-- delete line
-- The original mappings used marks and silent commands; we keep the same effect.
map('n', '<c-d>', "m`:silent +g/\\m^\\s*$/d<CR>``:noh<CR>", { noremap = true, silent = true })
map('n', '<c-s-d>', "m`:silent -g/\\m^\\s*$/d<CR>``:noh<CR>", { noremap = true, silent = true })

-- insert line
map('n', '<c-y>', ":set paste<CR>m`o<Esc>``:set nopaste<CR>", { noremap = true, silent = true })
map('n', '<c-s-y>', ":set paste<CR>m`O<Esc>``:set nopaste<CR>", { noremap = true, silent = true })


-- Re‑enable filetype detection
vim.cmd('filetype plugin indent on')
