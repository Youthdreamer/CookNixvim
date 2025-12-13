{
  imports = [
    ./lsp.nix
    ./blink.nix
    ./conform.nix
    ./fidget.nix
    # NOTE: 不启用该插件，因为lsp.nix中包含了 eslint
    # 如果想使用 eslint_d 就关闭掉 lsp.nix 的 eslint 并打开这个lint插件（配置好的对于js/jsx/ts/tsx）
    # ./lint.nix
  ];
}
