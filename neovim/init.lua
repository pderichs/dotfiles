function get_todays_todo_file_name() 
  local d = os.date("%Y%m%d")
  local todo_folder = os.getenv("TODO")

  return string.format("%s/%s.org.gpg", todo_folder, d)
end

function open_todays_todo_file()
  local path = get_todays_todo_file_name()
  local cmd = string.format(":e %s", path)

  vim.cmd(cmd)
end

function insert_text(text) 
  local row, col = unpack(vim.api.nvim_win_get_cursor(0))
  vim.api.nvim_buf_set_text(0, row - 1, col, row - 1, col, { text })
end

function insert_date()
  insert_text(os.date("%Y.%m.%d"))
end

function insert_line()
  insert_text('--------------------------------------------------------------------------------------')
end

-- Base setup
vim.cmd('autocmd!') -- Remove all vimrc autocommands

vim.scriptencoding = 'utf-8'
vim.opt.encoding = 'utf-8'
vim.opt.fileencoding = 'utf-8'

vim.wo.number = true

vim.opt.title = true
vim.opt.autoindent = true
vim.opt.smartindent = true
vim.opt.hlsearch = true
vim.opt.incsearch = true
vim.opt.backup = false
vim.opt.showcmd = true
vim.opt.cmdheight = 1
vim.opt.laststatus = 2
-- vim.opt.colorcolumn = "80"
vim.opt.expandtab = true
vim.opt.scrolloff = 10
vim.opt.shell = 'bash'
vim.opt.backupskip = { '/tmp/*', '/private/tmp/*' }
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true
vim.opt.swapfile = false
vim.opt.inccommand = 'split'
vim.opt.ignorecase = true -- Case insensitive searching UNLESS /C or capital in search
vim.opt.smarttab = true
vim.opt.breakindent = true
vim.opt.shiftwidth = 2
vim.opt.tabstop = 2
vim.opt.wrap = false -- do not wrap lines
vim.opt.backspace = { 'start', 'eol', 'indent' }
vim.opt.path:append { '**' } -- Finding files - Search down into subfolders
vim.opt.wildignore:append { '*/node_modules/*' }
vim.opt.relativenumber = true

-- Always change directory to the current buffer location
-- see: https://vim.fandom.com/wiki/Set_working_directory_to_the_current_file
vim.cmd('autocmd BufEnter * silent! lcd %:p:h')

-- Undercurl
vim.cmd([[let &t_Cs = "\e[4:3m"]])
vim.cmd([[let &t_Ce = "\e[4:0m"]])

-- Turn off paste mode when leaving insert
vim.api.nvim_create_autocmd("InsertLeave", {
  pattern = '*',
  command = "set nopaste"
})

-- Add asterisks in block comments
vim.opt.formatoptions:append { 'r' }

-- display
vim.opt.cursorline = true
vim.opt.termguicolors = true
vim.opt.winblend = 0
vim.opt.wildoptions = 'pum'
vim.opt.pumblend = 5
-- vim.opt.background = 'dark'
-- vim.cmd.colorscheme('quiet')

-- ***********************************************************
-- KEYS
vim.g.mapleader = " "

local keymap = vim.keymap

-- keymap.set('n', 'x', '"_x')

-- Mark until end of line
keymap.set('n', '<leader>,', 'v$')

-- Save with root permission (not working for now)
--vim.api.nvim_create_user_command('W', 'w !sudo tee > /dev/null %', {})

-- New tab
keymap.set('n', 'te', ':tabedit')

-- Move window
keymap.set('', '<leader>wh', '<C-w>h')
keymap.set('', '<leader>wk', '<C-w>k')
keymap.set('', '<leader>wj', '<C-w>j')
keymap.set('', '<leader>wl', '<C-w>l')

keymap.set('', '<leader>w<left>', '<C-w>h')
keymap.set('', '<leader>w<up>', '<C-w>k')
keymap.set('', '<leader>w<down>', '<C-w>j')
keymap.set('', '<leader>w<right>', '<C-w>l')

-- Resize window (todo - remap?)
keymap.set('n', '<C-w><left>', '<C-w><')
keymap.set('n', '<C-w><right>', '<C-w>>')
keymap.set('n', '<C-w><up>', '<C-w>+')
keymap.set('n', '<C-w><down>', '<C-w>-')

-- keymap.set('n', 'gd', 'gotodefinition')

keymap.set('n', '<leader>fs', ':w<CR>')
keymap.set('n', '<leader>bd', ':bd<CR>')
keymap.set('n', '<leader>bb', ':Telescope buffers<CR>')
keymap.set('n', '<leader>s*', ':Telescope grep_string<CR>')
keymap.set('n', '<leader>ss', ':Telescope current_buffer_fuzzy_find<CR>')
keymap.set('n', '<leader>/', ':Telescope live_grep<CR>')
--keymap.set('n', '<leader>*', ':Telescope grep_string search=<C-R><C-W><CR>')
keymap.set('n', '<leader>*', ':Rg <C-R><C-W><CR>')
keymap.set('n', '<leader>fr', ':Telescope oldfiles<CR>')
keymap.set('n', '<leader>ji', ':Telescope treesitter<CR>')
keymap.set('n', '<leader>pl', ':Telescope registers<CR>')
keymap.set('v', '<leader>pl', ':Telescope registers<CR>')
keymap.set('n', '<leader>ht', ':Telescope colorscheme<CR>')
keymap.set('n', '<leader>gg', ':Neogit<CR>')
keymap.set('n', '<leader><leader>', ':Telescope commands<CR>')
keymap.set('n', '<leader>cd', ':cd %:p:h<CR>') -- make file folder current folder
keymap.set('n', '<leader>nt', ':NERDTreeToggle<CR>')
keymap.set('n', '<leader>qq', ':qa<CR>')
keymap.set('n', '<leader>gb', ':GitBlameToggle<CR>')
keymap.set('n', '<leader>to', open_todays_todo_file)
keymap.set('n', '<leader>w/', ':vsp<CR>')
keymap.set('n', '<leader>w-', ':sp<CR>')
keymap.set('n', '<leader>r', ':set relativenumber!<CR>')
keymap.set('n', '<leader>pf', ':Telescope find_files<CR>')
-- keymap.set('n', '<leader>pf', ':Telescope git_files<CR>')
keymap.set('n', '<leader>ff', ':Ranger<CR>')
keymap.set('n', '<leader>id', insert_date)
keymap.set('n', '<leader>il', insert_line)
keymap.set('n', '<leader>w-', ':split<Return><C-w>w')
keymap.set('n', '<leader>w/', ':vsplit<Return><C-w>w')
keymap.set('n', '<leader>ww', '<C-w>w')
keymap.set('n', '<leader>wd', ':close<CR>')
keymap.set('n', '<leader>hh', 'gg<S-v>G')
keymap.set("n", "<leader>pv", vim.cmd.Ex)
keymap.set('n', '<leader>fh', ":Telescope help_tags<CR>")
keymap.set('n', '<leader>ev', ":e $MYVIMRC<CR>")
keymap.set('n', '<leader>sv', ":source $MYVIMRC<CR>")
keymap.set('n', '<leader>so', ":so<CR>")
keymap.set('n', '<leader>cf', "ggVG=``")
keymap.set('n', '<leader>bn', ":ene<CR>")
keymap.set('n', '<leader>of', ":e %:p:s,.h$,.X123X,:s,.cpp$,.h,:s,.X123X$,.cpp,<CR>")
keymap.set('n', '<leader>cc', ":make ")
keymap.set('n', '<leader>pl', ":Telescope registers<CR>")
keymap.set('n', '<leader>rr', ":Telescope resume<CR>")
keymap.set('n', '<leader>lic', ":Telescope lsp_incoming_calls<CR>")
keymap.set('n', '<leader>loc', ":Telescope lsp_outgoing_calls<CR>")
keymap.set('n', '<leader>lws', ":Telescope lsp_workspace_symbols<CR>")
keymap.set('n', '<leader>lb', ":BookmarkShowAll<CR>")
keymap.set('n', '<leader><CR>', ":BookmarkAnnotate<CR>")
keymap.set('n', '<leader>wr', ":set wrap!<CR>")
keymap.set('n', '<leader>ot', ":term<CR>")
keymap.set('n', '<leader>tt', ":Telescope tags<CR>")
keymap.set('n', '<leader>tz', ":ZenMode<CR>")
keymap.set('n', '<leader>jj', ":Telescope lsp_workspace_symbols<CR>")
keymap.set('n', '<leader>jd', ":Telescope diagnostics<CR>")

vim.keymap.set('n', '<leader>gr', function()
  require('telescope.builtin').grep_string({ search = vim.fn.input("Grep > ") })
end)

keymap.set('n', '<C-Up>', '{')
keymap.set('n', '<C-Down>', '}')
keymap.set('n', '<C-Left>', 'b')
keymap.set('n', '<C-Right>', 'w')
keymap.set('n', '<C-k>', '{')
keymap.set('n', '<C-j>', '}')

keymap.set('n', 'U', ':Telescope lsp_references<CR>')
keymap.set('n', 'gc', ':CommentToggle<CR>')
keymap.set('n', 'gb', '<C-o>') -- go back (<C-i> to go forward)
-- keymap.set('n', 'gss', ':HopChar2<CR>') -- Jump to char

keymap.set('n', '\\', 'V') 
keymap.set('n', '-', 'V') 

-- thanks to https://www.youtube.com/watch?v=w7i4amO_zaE
--   https://github.com/ThePrimeagen/init.lua
-- leaves cursor where it is on line join operations
keymap.set('n', 'J', 'mzJ`z')
-- provides pasting multiple times by somewhat preserving the previous register
keymap.set('x', '<leader>p', '"_dP')
-- copy to system clipboard
keymap.set('n', '<leader>y', '"*y')
keymap.set('v', '<leader>y', '"*y')
keymap.set('n', '<leader>Y', '"*Y')

keymap.set('n', '<leader>d', '"_d')
keymap.set('v', '<leader>d', '"_d')
keymap.set("n", '<F5>', vim.cmd.UndotreeToggle)

-- no need for "window bottom"
keymap.set('n', 'L', '<nop>')

-- Make C-BS in insert mode work (delete previous word)
-- thanks to https://www.reddit.com/r/neovim/comments/okbag3/comment/h58k9p7/?utm_source=reddit&utm_medium=web2x&context=3
keymap.set('i', '<C-BS>', '<C-W>', {noremap = true})

-- ***********************************************************

-- load lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

local status_ok, lazy = pcall(require, "lazy")
if status_ok then
  lazy.setup({
    'neovim/nvim-lspconfig',
    'folke/which-key.nvim',
    'aymericbeaumet/vim-symlink',
    'nvim-lua/plenary.nvim',
    'terrortylor/nvim-comment',
    { 'nvim-telescope/telescope.nvim', tag = '0.1.5' },
    'folke/zen-mode.nvim',
    'folke/neodev.nvim',
    'nvim-treesitter/nvim-treesitter',
    'MattesGroeger/vim-bookmarks',
    'TimUntersberger/neogit',
    'preservim/nerdtree',
    'jamessan/vim-gnupg',
    'francoiscabrol/ranger.vim',
    'mbbill/undotree',
    'junegunn/fzf',
    'junegunn/fzf.vim',
    'alaviss/nim.nvim',
    'projekt0n/github-nvim-theme',
    'rainglow/vim', -- themes
    'rbgrouleff/bclose.vim', -- required by ranger
    {
      'nvim-orgmode/orgmode',
      event = 'VeryLazy',
      config = function()
        -- Setup orgmode
        require('orgmode').setup({
          org_agenda_files = '~/orgfiles/**/*',
          org_default_notes_file = '~/orgfiles/refile.org',
        })
      end,
    }
  })
else
  print("Unable to load lazy.nvim")
end

-- thanks to https://github.com/LunarVim/Neovim-from-scratch
-- We use a protected require so we don't end up in an error on 
-- a fresh neovim installation
local status_ok, nvim_comment = pcall(require, 'nvim_comment')
if status_ok then
  nvim_comment.setup()
else
  print('Unable to load nvim_comment')
end

-- Neogit
local status_ok, neogit = pcall(require, 'neogit')
if status_ok then
  neogit.setup {}
end

-- RANGER 
-- show hidden files by default
vim.g.ranger_command_override = 'ranger --cmd "set show_hidden=true"'
vim.g.ranger_map_keys = 0 -- prevent ranger plugin from updating keys

-- Incremental selection
local status_ok, treesitter_config = pcall(require, 'nvim-treesitter.configs')
if status_ok then
  treesitter_config.setup {
    incremental_selection = {
      enable = true,
      keymaps = {
        init_selection = "M",
        node_incremental = "m",
        --scope_incremental = "",
        node_decremental = "<M-BS>",
      },
    },
  }
else
  print("Unable to local treesitter config.")
end

-- vim.opt.background = 'dark'
-- vim.cmd.colorscheme('allure-contrast')
vim.cmd.colorscheme('github_dark_default')
