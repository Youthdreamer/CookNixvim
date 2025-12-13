{
  plugins.render-markdown.enable = true;
  plugins.render-markdown.lazyLoad = {
    enable = true;
    settings = {
      ft = ["markdown" "norg" "rmd" "org" "Avante" "codecompanion"];
    };
  };
  plugins.render-markdown.settings = {
    heading = {
      render_modes = true;
      icons = ["󰉫 " "󰉬 " "󰉭 " "󰉮 " "󰉯 " "󰉰 "];
      border = true;
    };
    sign = {
      enabled = false;
    };
    anti_conceal = {
      disabled_modes = ["n"];
      ignore = {
        bullet = true;
        head_border = true;
        head_background = true;
      };
    };
  };
}
