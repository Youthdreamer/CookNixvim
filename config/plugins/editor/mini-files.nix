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
      action = "<CMD>lua MiniFiles.open()<CR>";
      key = "-";
      options = {
        silent = true;
        desc = "快捷文件操作";
      };
    }
  ];
}
