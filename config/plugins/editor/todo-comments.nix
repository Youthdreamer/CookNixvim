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
      action = "<CMD>Telescope todo-comments todo theme=dropdown previewer=false<CR>";
      key = "<leader>T";
      options = {
        silent = true;
        desc = "Todo 查询";
      };
    }
  ];
}
