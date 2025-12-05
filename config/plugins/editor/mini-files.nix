{
  plugins.mini-files.enable = true;
  plugins.mini-files.lazyLoad = {
    enable = true;
    settings.event = [
      "BufReadPost"
      "BufNewFile"
    ];
  };
  plugins.mini-files.settings = {
    windows = {
      preview = true;
    };
  };
  keymaps = [
    {
      mode = "n";
      action.__raw = ''
        function()
          local ok, _ = pcall(require, "mini.files")
          if not ok then
            vim.notify(
              "mini-files 未加载，请检查插件是否启用",
              vim.log.levels.WARN,
              { title = "mini-files" }
            )
            return
          end
          MiniFiles.open()
        end
      '';
      key = "-";
      options = {
        silent = true;
        desc = "快捷文件操作";
      };
    }
  ];
}
