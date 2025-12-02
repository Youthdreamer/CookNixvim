{pkgs, ...}: {
  plugins.treesitter = {
    enable = true;
    folding = false;
    nixvimInjections = true;
    settings = {
      highlight.enable = true;
      indent.enable = true;
      incremental_selection.enable = true;
    };
    #TODO: 优化TS解析器列表
    grammarPackages = with pkgs.vimPlugins.nvim-treesitter.builtGrammars; [
      bash # bashls
      c # clangd
      cpp # clangd
      lua # lua_ls
      python # pyright, ruff
      rust # rust_analyzer
      go # gopls
      javascript # ts_ls
      typescript # ts_ls
      html # html, emmet_ls
      css # cssls, stylelint_lsp
      json # jsonls
      toml # taplo
      nix # nil_ls
      markdown # marksman
      vim # vimscript
      vimdoc # vim help
      xml # 一些 XML 文件
      yaml # yaml 文件
    ];
  };

  plugins.treesitter.lazyLoad = {
    settings = {
      event = ["User LazyFile"];
    };
  };
}
