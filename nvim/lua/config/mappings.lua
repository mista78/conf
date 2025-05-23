local function map(mode, lhs, rhs, opts)
   -- set default value if not specify
   if opts.noremap == nil then
      opts.noremap = true
   end
   if opts.silent == nil then
      opts.silent = true
   end

   vim.keymap.set(mode, lhs, rhs, opts)
end

vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- better up/down
-- vim.keymap.set({ "n", "x" }, "j", function()
--    return vim.v.count > 0 and "j" or "gj"
-- end, { expr = true })
-- vim.keymap.set({ "n", "x" }, "k", function()
--    return vim.v.count > 0 and "k" or "gk"
-- end, { expr = true })

map("n", "<C-u>", "<C-u>zz", {})
map("n", "<C-d>", "<C-d>zz", {})
map("n", "<C-b>", "<C-b>zz", {})
map("n", "<C-f>", "<C-f>zz", {})

-- leader movements
map("n", "<Leader>w", ":write<CR>", {})
map("n", "<Leader>s", ":source %<CR>", {})
map("n", "<Leader>v", ":cd ~/.config/nvim/<CR>:Telescope find_files<CR>", {})
map("n", "<Leader>m", ":make<CR>", {})
map("n", "<Leader>b", ":!busted %<CR>", {})

-- system clipboard
map({ "n", "v" }, "<Leader>y", '"+y', {})
map({ "n" }, "<Leader>Y", '"+y$', {})

map({ "n", "v" }, "<Leader>p", '"+p', {})
map({ "n", "v" }, "<Leader>P", '"+P', {})
