{pkgs, ...}: {
  #######主题选择功能########
  #使用lua文件导入的主题修改功能
  extraPlugins = with pkgs.vimPlugins; [
    neovim-ayu
    catppuccin-nvim
    cyberdream-nvim
    dracula-nvim
    github-nvim-theme
    gruvbox-nvim
    kanagawa-nvim
    monokai-pro-nvim
    onedark-nvim
    nightfox-nvim
    nord-nvim
    rose-pine
    tokyonight-nvim
    vague-nvim
  ];
  extraFiles."lua/features/theme-list.lua".source = ./theme-list.lua;
  extraFiles."lua/features/switch-theme.lua".source = ./switch-theme.lua;

  # NOTE: 这个主题切换感觉是个半残废功能，但能用。保持优雅!!!
  autoCmd = [
    {
      desc = "加载颜色主题切换功能";
      event = "VimEnter";
      callback = {
        __raw = ''
          function()
            require("features.switch-theme").setup()
          end'';
      };
    }
  ];

  keymaps = [
    {
      mode = "n";
      key = "<leader>T";
      action = "<cmd>ThemeSwitch theme=dropdown<cr>";
      options = {
        silent = true;
        desc = "主题切换";
      };
    }
  ];
}
