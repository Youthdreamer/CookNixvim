{
  plugins.aerial.enable = true;
  plugins.aerial.lazyLoad = {
    enable = true;
    settings = {
      event = ["LspAttach"];
    };
  };
  plugins.aerial.settings = {
    attach_mode = "global";
    show_guides = true;
    filter_kind = false;
    disable_max_lines = 5000;
    highlight_on_hover = true;
    backends = [
      "treesitter"
      "lsp"
      "markdown"
      "man"
    ];
    ignore = {
      filetypes = [
        "gomod"
      ];
    };
    layout = {
      position = "right";
      width = 30;
      min_width = 15;
    };
  };

  keymaps = [
    # 打开/关闭符号面板
    {
      action = "<cmd>AerialToggle<cr>";
      key = "<leader>cs";
      options = {
        silent = true;
        desc = "切换符号面板(Aerial)";
      };
    }
  ];
}
