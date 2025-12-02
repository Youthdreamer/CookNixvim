{
  plugins.dashboard.enable = true;
  # TODO: 修复懒加载
  # plugins.dashboard.lazyLoad = {
  #   settings = {
  #     # event = ["VimEnter"];
  #     lazy = false;
  #   };
  # };
  plugins.dashboard.settings = {
    change_to_vcs_root = true;
    theme = "doom";
    config = {
      header = [
        ""
        ""
        ""
        " ██████╗ ██████╗  ██████╗ ██╗  ██╗"
        "██╔════╝██╔═══██╗██╔═══██╗██║ ██╔╝"
        "██║     ██║   ██║██║   ██║█████╔╝ "
        "██║     ██║   ██║██║   ██║██╔═██╗ "
        "╚██████╗╚██████╔╝╚██████╔╝██║  ██╗"
        " ╚═════╝ ╚═════╝  ╚═════╝ ╚═╝  ╚═╝"
        "┌────────────────────────────────┐"
        "|        Now, Say My Name.       |"
        "└────────────────────────────────┘"
        ""
        ""
      ];
      footer = [
        "Life is a fucking movie. 人生入戏啊! 靓仔!"
      ];
      center = [
        {
          action = {
            __raw = "function(path) vim.cmd('ene | startinsert') end";
          };
          icon = " ";
          desc = "Files   ";
          group = "DiagnosticHint";
          key = "n";
        }
        {
          action = {
            __raw = "function(path) vim.cmd('Telescope find_files') end";
          };
          group = "Label";
          icon = " ";
          desc = "Find   ";
          icon_hl = "@variable";
          key = "f";
        }
        {
          action = {
            __raw = "function(path) vim.cmd('qa') end";
          };
          icon = "󰈆 ";
          desc = "Exit   ";
          group = "Number";
          key = "q";
        }
      ];
      # week_header = {
      #   enable = true;
      # };
    };
  };

  # autoCmd = [
  #   {
  #     desc = "取消自动换行注释";
  #     event = "VimEnter";
  #     callback = {
  #       __raw = ''
  #         function()
  #           require('dashboard')
  #         end
  #       '';
  #     };
  #   }
  # ];
}
