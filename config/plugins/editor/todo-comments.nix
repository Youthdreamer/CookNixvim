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
      action.__raw = ''
        function()
          local ok, _ = pcall(require, "todo-comments")
          if not ok then
            vim.notify(
              "todo-comments 未加载，请检查插件是否启用",
              vim.log.levels.WARN,
              { title = "Todo" }
            )
            return
          end

          vim.cmd("Telescope todo-comments todo theme=dropdown")
        end
      '';
      key = "<leader>ft";
      options = {
        silent = true;
        desc = "Todo 查询";
      };
    }
  ];
}
