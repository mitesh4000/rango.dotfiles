-- Normal mode mappings
vim.keymap.set("n", "<leader>c", ":nohlsearch<CR>", { desc = "Clear search highlights" })


function ToggleExplorer()
  local bufnr = vim.api.nvim_get_current_buf()
  local ft = vim.api.nvim_buf_get_option(bufnr, 'filetype')

  -- If current window is netrw, close it
  if ft == 'netrw' then
    vim.cmd('bd')  -- delete buffer (close netrw window)
  else
    -- Otherwise, open netrw
    vim.cmd('Explore')
  end
end

vim.keymap.set('n', '<leader>e', ToggleExplorer, { silent = true })
vim.keymap.set('n', '<leader>ff', ":find ",{desc="find file"})


-- Center screen when jumping
vim.keymap.set("n", "n", "nzzzv", { desc = "Next search result (centered)" })
vim.keymap.set("n", "N", "Nzzzv", { desc = "Previous search result (centered)" })
vim.keymap.set("n", "<C-d>", "<C-d>zz", { desc = "Half page down (centered)" })
vim.keymap.set("n", "<C-u>", "<C-u>zz", { desc = "Half page up (centered)" })


-- Delete without yanking
vim.keymap.set({ "n", "v" }, "<leader>d", '"_d', { desc = "Delete without yanking" })

vim.keymap.set({"n"},"<leader>bn",":bnext<CR>",{desc="next buffer"})
vim.keymap.set({"n"},"<leader>bp",":bprevious<CR>",{desc="previous buffer"})

-- Better window navigation
vim.keymap.set("n", "<C-h>", "<C-w>h", { desc = "Move to left window" })
vim.keymap.set("n", "<C-j>", "<C-w>j", { desc = "Move to bottom window" })
vim.keymap.set("n", "<C-k>", "<C-w>k", { desc = "Move to top window" })
vim.keymap.set("n", "<C-l>", "<C-w>l", { desc = "Move to right window" })

-- Splitting & Resizing
vim.keymap.set("n", "<leader>sv", ":vsplit<CR>", { desc = "Split window vertically" })
vim.keymap.set("n", "<leader>sh", ":split<CR>", { desc = "Split window horizontally" })
vim.keymap.set("n", "<C-Up>", ":resize +2<CR>", { desc = "Increase window height" })
vim.keymap.set("n", "<C-Down>", ":resize -2<CR>", { desc = "Decrease window height" })
vim.keymap.set("n", "<C-Left>", ":vertical resize -2<CR>", { desc = "Decrease window width" })
vim.keymap.set("n", "<C-Right>", ":vertical resize +2<CR>", { desc = "Increase window width" })



-- Move lines up/down
vim.keymap.set("n", "<A-j>", ":m .+1<CR>==", { desc = "Move line down" })
vim.keymap.set("n", "<A-k>", ":m .-2<CR>==", { desc = "Move line up" })
vim.keymap.set("v", "<A-j>", ":m '>+1<CR>gv=gv", { desc = "Move selection down" })
vim.keymap.set("v", "<A-k>", ":m '<-2<CR>gv=gv", { desc = "Move selection up" })


    -- Better indenting in visual mode
    vim.keymap.set("v", "<", "<gv", { desc = "Indent left and reselect" })
    vim.keymap.set("v", ">", ">gv", { desc = "Indent right and reselect" })



-- Better J behavior
vim.keymap.set("n", "J", "mzJ`z", { desc = "Join lines and keep cursor position" })


-- ============================================================================
-- USEFUL FUNCTIONS
-- ============================================================================

-- Copy Full File-Path
vim.keymap.set("n", "<leader>pa", function()
	local path = vim.fn.expand("%:p")
	vim.fn.setreg("+", path)
	print("file:", path)
end)

-- Basic autocommands
local augroup = vim.api.nvim_create_augroup("UserConfig", {})

-- Highlight yanked text
vim.api.nvim_create_autocmd("TextYankPost", {
  group = augroup,
  callback = function()
    vim.highlight.on_yank()
  end,
})

-- return to the last edit position on file open
vim.api.nvim_create_autocmd("BufReadpost",{
  group=augroup,
  callback=function()
    local mark = vim.api.nvim_buf_get_mark(0,'"')
    local lcount=vim.api.nvim_buf_line_count(0)
    print("line number",mark)
    if mark[1]>0 and mark[1]<=lcount then
      pcall(vim.api.nvim_win_set_cursor,0,mark)
    end
  end,
})

vim.api.nvim_create_autocmd("Filetype",{
  group=augroup,
  pattern = {"javascript","typescript","json","html","css"},
  callback=function()
    vim.opt_local.tabstop =2
    vim.opt_local.shiftwidth = 2
  end,
})


vim.api.nvim_create_autocmd("Filetype",{
  group=augroup,
  pattern = {"lua"},
  callback=function()
    vim.opt_local.tabstop =4
    vim.opt_local.shiftwidth = 4
  end,
})

vim.api.nvim_create_autocmd("TermClose", {
  group = augroup,
  callback = function()
    if vim.v.event.status == 0 then
      vim.api.nvim_buf_delete(0, {})
    end
  end,
})

vim.api.nvim_create_autocmd("TermOpen",{
  group=augroup,
  callback=function()
    vim.opt_local.number = false
    vim.opt_local.relativenumber=false
    vim,opt_local.signcolumn="no"
  end,
})



vim.keymap.set("n", "<leader>ts", function()
	local testVar = vim.api.nvim_win_get_cursor(0)
	print("file:", testVar )
end)

