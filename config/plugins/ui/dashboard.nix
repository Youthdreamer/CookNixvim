# NOTE: 这个首页极大的拉低了加载的速度,关掉能大幅提升，但是关掉就不好看了。
# NOTE:保持优雅!!!
{
  plugins.dashboard.enable = true;
  plugins.dashboard.lazyLoad = {
    settings = {
      enabled.__raw = ''
        function()
          return vim.fn.argc() == 0
        end
      '';
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
          key = "f";
        }
        {
          action = {
            __raw = "function(path) vim.cmd('Telescope projects layout_config={height=0.6,width=0.6}') end";
          };
          group = "Label";
          icon = " ";
          desc = "Project   ";
          key = "p";
        }
        {
          action = {
            __raw = ''
              function(path)
                -- require('persistence').load()
                local ok, _ = pcall(require, "persistence")
                if not ok then
                  vim.notify("persistence 未准备完毕", vim.log.levels.WARN, { title = "Todo" })
                  return nil
                end
                return require('persistence').load()
              end
            '';
          };
          group = "Label";
          icon = "󰒲 ";
          desc = "Session   ";
          key = "s";
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
