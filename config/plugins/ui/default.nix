{
  imports = [
    ./dashboard.nix # 不启用该插件开启速度大幅提升。不启用这个插件建议也把 会话插件persistence.nix也关闭掉
    ./noice.nix
    ./lualine.nix
    ./bufferline.nix
    ./colorizer.nix
    ./dressing.nix
    ./transparent.nix
  ];
}
