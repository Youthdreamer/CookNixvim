{
  imports = [
    ./editor
    ./ui
    ./lsp
    ./utils
    ./dap
    ./ai
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
