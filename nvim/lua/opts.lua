vim.g.mapleader = " "

vim.opt.clipboard = "unnamedplus"
vim.opt.termguicolors = true
vim.opt.cursorline = true


vim.cmd.colorscheme("retrobox")  

-- vim.api.nvim_set_hl(0,"Normal",{bg="none"}) 
-- vim.api.nvim_set_hl(0,"NormalNC",{bg="none"})
-- vim.api.nvim_set_hl(0,"EndOfBuffer",{bg="none"})


-- line numbers
vim.wo.number = true
vim.wo.relativenumber = true
vim.opt.scrolloff=10
vim.opt.sidescrolloff=8



-- Indentation
vim.opt.tabstop = 2                                -- Tab width
vim.opt.shiftwidth = 2                             -- Indent width
vim.opt.softtabstop = 2                            -- Soft tab stop
vim.opt.expandtab = true                           -- Use spaces instead of tabs
vim.opt.smartindent = true                         -- Smart auto-indenting
vim.opt.autoindent = true                          -- Copy indent from current li

-- Search settings OPT
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.incsearch = true


-- visual settings ( )
vim.opt.termguicolors = true
vim.opt.signcolumn = "yes" -- to display symbols for warning and errors on left of line numbers
vim.opt.colorcolumn = ""
vim.opt.showmatch = true
vim.opt.matchtime = 2
vim.opt.cmdheight = 1
vim.opt.completeopt = "menuone,noinsert,noselect" -- opt for auto complete dropdown
vim.opt.showmode = true
vim.opt.pumheight = 10 -- popup menu for autocomplete
vim.opt.pumblend = 10 -- popup menu for autocomplete
vim.opt.winblend = 0 -- popup menu for autocomplete
vim.opt.conceallevel = 0
vim.opt.concealcursor = ""
vim.opt.lazyredraw = true
vim.opt.synmaxcol = 300


-- File handling
vim.opt.backup = false                             -- Don't create backup files
vim.opt.writebackup = false                        -- Don't create backup before writing
vim.opt.swapfile = false                           -- Don't create swap files
vim.opt.undofile = true                            -- Persistent undo
vim.opt.undodir = vim.fn.expand("~/.vim/undodir")  -- Undo directory
vim.opt.updatetime = 300                           -- Faster completion
vim.opt.timeoutlen = 500                           -- Key timeout duration
vim.opt.ttimeoutlen = 0                            -- Key code timeout
vim.opt.autoread = true                            -- Auto reload files changed outside vim
vim.opt.autowrite = false                          -- Don't auto save


-- behaviour settings
vim.opt.hidden = true -- alow hidden bufferd
vim.opt.errorbells = true -- no error  bell
vim.opt.backspace = "indent,eol,start" -- backsoace behaviour


-- file handling
vim.opt.writebackup = false
vim.opt.swapfile = true -- swap file stores every change you made and you can recover the changes after crash evan if its not saved 
vim.opt.undofile = true -- with this your undu history will be saved in actual file insted of history
vim.opt.undodir = vim.fn.expand("~/.vim/undodir")  -- Undo directory
vim.opt.updatetime = 300                           -- Faster completion
vim.opt.timeoutlen = 500                           -- Key timeout duration example maximum duration between pressing <soace> + E
vim.opt.ttimeoutlen = 0                            -- Key code timeout 
vim.opt.autoread = true                            -- Auto reload files changed outside vim
vim.opt.autowrite = false                          -- Don't auto save




-- Behavior settings
vim.opt.hidden = true                              -- Allow hidden buffers (buffer saved in memory so you can switch bwtween buffers without saving them) 
vim.opt.errorbells = false                         -- No error bells (to show error bell in form of screen flash or bell sound)
vim.opt.backspace = "indent,eol,start"             -- Better backspace behavior
vim.opt.autochdir = false                          -- Don't auto change directory of the currently open buffer
vim.opt.iskeyword:append("-")                      -- Treat dash as part of word
vim.opt.path:append("**")                          -- include subdirectories in search
vim.opt.selection = "exclusive"                    -- Selection behavior
vim.opt.mouse = "a"                                -- Enable mouse support
vim.opt.clipboard:append("unnamedplus")            -- Use system clipboard
vim.opt.modifiable = true                          -- Allow buffer modifications (used for preventing edit in help files plugin windows)
vim.opt.encoding = "UTF-8"                         -- Set encoding

-- Cursor settings
vim.opt.guicursor = "n-v-c:block,i-ci-ve:ver25,r-cr:hor20,o:hor50,a:blinkwait700-blinkoff400-blinkon250-Cursor/lCursor,sm:block-blinkwait175-blinkoff150-blinkon175"


-- Folding settings
vim.opt.foldmethod = "expr"                             -- Use expression for folding
-- vim.wo.vim.foldexpr = "v:lua.vim.treesitter.foldexpr()" -- treesitter will decide the foldes based on the syntaxt of language 
vim.opt.foldlevel = 99                                  -- Start with all folds open

-- Split behavior
vim.opt.splitbelow = true                          -- Horizontal splits go below
vim.opt.splitright = true                          -- Vertical splits go right

-- Key mappings
vim.g.mapleader = " "                              -- Set leader key to space
vim.g.maplocalleader = " "                         -- Set local leader key (NEW)


-- Normal mode mappings
vim.keymap.set("n", "<leader>c", ":nohlsearch<CR>", { desc = "Clear search highlights" })

-- Optional: Highlight current line number differently
vim.cmd("highlight CursorLineNr cterm=bold gui=bold")
