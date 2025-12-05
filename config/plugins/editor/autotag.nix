{
  plugins.ts-autotag.enable = true;
  plugins.ts-autotag.lazyLoad = {
    enable = true;
    settings = {
      ft = ["html" "xml" "vue" "javascriptreact" "typescriptreact"];
    };
  };
  plugins.ts-autotag.settings = {
    opts = {
      enable_close = false; # tag 关自动补
      enable_close_on_slash = false;
      enable_rename = true;
    };
  };
}
