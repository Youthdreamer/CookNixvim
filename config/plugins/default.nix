{
  imports = [
    ./editor
    ./ui
    ./utils
    ./lsp
    ./git
    ./snippets
  ];

  colorschemes.gruvbox.enable = true;
  colorschemes.gruvbox.lazyLoad = {
    enable = true;
    settings = {
      event = ["User Cooklazy"];
    };
  };

  plugins = {
    lz-n.enable = true;
    web-devicons.enable = true;
    web-devicons.lazyLoad = {
      enable = true;
      settings = {
        event = ["User CookLazy"];
      };
    };
    nvim-autopairs.enable = true;
    nvim-autopairs.lazyLoad = {
      enable = true;
      settings = {
        event = ["InsertEnter"];
      };
    };
  };
}
