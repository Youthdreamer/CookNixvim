{
  imports = [
    ./aerial.nix
    ./autotag.nix
    ./mini-files.nix
    ./mini-indentscope.nix
    ./neo-tree.nix
    ./ufo.nix
    ./treesitter.nix
    ./todo-comments.nix
    ./indent-blankline.nix
    ./rainbow-delimiters.nix
  ];

  plugins.nvim-autopairs.enable = true;
  plugins.nvim-autopairs.lazyLoad = {
    enable = true;
    settings = {
      event = ["InsertEnter"];
    };
  };
}
