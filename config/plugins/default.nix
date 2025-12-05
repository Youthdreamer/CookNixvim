{
  imports = [
    ./editor
    ./ui
    ./utils
    ./lsp
    ./git
    ./snippets
    ./colorschemes
  ];

  extraConfigLua = ''
    require("features.switch-theme").setup()
  '';

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
