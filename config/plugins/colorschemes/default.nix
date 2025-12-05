{pkgs, ...}: {
  #######主题选择功能########
  #使用lua文件导入的主题修改功能
  extraPlugins = with pkgs.vimPlugins; [
    catppuccin-nvim
    github-nvim-theme
    gruvbox-nvim
    kanagawa-nvim
    nightfox-nvim
    nord-nvim
    rose-pine
    tokyonight-nvim
    vague-nvim
  ];
  extraFiles."lua/features/theme-list.lua".source = ./theme-list.lua;
  extraFiles."lua/features/switch-theme.lua".source = ./switch-theme.lua;

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
