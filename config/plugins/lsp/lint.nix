{pkgs, ...}: {
  extraPackages = [
    pkgs.eslint_d
  ];
  plugins.lint.enable = true;
  plugins.lint.lazyLoad = {
    enable = true;
    settings = {
      event = ["User CookLazy"];
    };
  };
  plugins.lint.lintersByFt = {
    javascript = ["eslint_d"];
    typescript = ["eslint_d"];
    javascriptreact = ["eslint_d"];
    typescriptreact = ["eslint_d"];
  };
  plugins.lint.autoCmd = {
    event = ["BufWritePost" "InsertLeave"];
    callback = {
      __raw = ''
        function()
          require('lint').try_lint()
        end
      '';
    };
  };
}
