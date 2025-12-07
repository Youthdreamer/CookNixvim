{
  imports = [
    ./editor
    ./ui
    ./utils
    ./lsp
    ./dap
    ./git
    ./snippets
    ./colorschemes
    ./dependencies
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
