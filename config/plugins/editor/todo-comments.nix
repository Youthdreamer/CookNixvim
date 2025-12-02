{
  plugins.todo-comments.enable = true;
  plugins.todo-comments.lazyLoad = {
    enable = true;
    settings.event = "BufReadPost";
  };
  plugins.todo-comments.settings = {
    signs = true;
  };

  keymaps = [
    {
      action = "<CMD>Telescope todo-comments todo<CR>";
      key = "<leader>tt";
      options = {
        silent = true;
        desc = "Todo 查询";
      };
    }
  ];
}
