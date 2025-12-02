{
  plugins.indent-blankline.enable = true;
  plugins.indent-blankline.lazyLoad = {
    enable = true;
    settings.event = "BufReadPost";
  };
  plugins.indent-blankline.settings = {
    exclude = {
      buftypes = [
        "terminal"
        "quickfix"
      ];
      filetypes = [
        "dashboard"
      ];
    };
    indent = {
      char = "│";
    };
  };
}
