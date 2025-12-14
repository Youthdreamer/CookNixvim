{
  extraConfigLua = ''
    if vim.g.neovide then
      local map = vim.keymap.set
      map("n", "<C-=>", function()
        vim.o.guifont = string.gsub(vim.o.guifont, ":h%d+", ":h" .. (tonumber(vim.o.guifont:match(":h(%d+)")) + 1))
      end, { silent = true, desc = "增大字体" })
      map("n", "<C-->", function()
        vim.o.guifont = string.gsub(vim.o.guifont, ":h%d+", ":h" .. (tonumber(vim.o.guifont:match(":h(%d+)")) - 1))
      end, { silent = true, desc = "减小字体" })
    end
  '';
}
