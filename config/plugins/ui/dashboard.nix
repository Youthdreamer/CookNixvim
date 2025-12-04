{
  plugins.dashboard.enable = true;
  plugins.dashboard.lazyLoad = {
    settings = {
      event = ["VimEnter"];
    };
  };
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
            __raw = "function(path) vim.cmd('Telescope find_files theme=dropdown previewer=false layout_config={height=0.3}') end";
          };
          group = "Label";
          icon = " ";
          desc = "Find   ";
          icon_hl = "@variable";
          key = "f";
        }
        {
          action = {
            __raw = "function(path) vim.cmd('Telescope projects layout_config={height=0.8}') end";
          };
          group = "Label";
          icon = " ";
          desc = "Project   ";
          icon_hl = "@variable";
          key = "p";
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
}
