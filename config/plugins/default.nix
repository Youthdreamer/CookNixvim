{
  imports = [
    ./editor
    ./ui
    ./lsp
    ./utils
    ./dap
    # ./ai # 默认不导入ai插件，如果需要ai插件请在将此注释打开
    ./git
    ./snippets
    ./colorschemes
    ./dependencies
    ./github # 安装github上的插件(含有配置示例)
  ];

  plugins = {
    lz-n.enable = true;
    web-devicons.enable = true;
    web-devicons.lazyLoad = {
      enable = true;
      settings = {
        event = ["User CookLazy"];
      };
    };
  };
}
