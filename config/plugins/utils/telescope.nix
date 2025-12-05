{
  plugins.telescope = {
    enable = true;
    lazyLoad.settings.event = "User LazyFile";
    # lazyLoad.settings.cmd = "Telescope"; # telescope的配置无法加载
  };
  #  插件Telescope的插件
  plugins.telescope.extensions = {
    fzf-native = {
      enable = true;
    };

    file-browser = {
      enable = true;
    };

    live-grep-args = {
      enable = true;
    };
  };
  # Telescope设置
  plugins.telescope.settings = {
    defaults = {
      mappings = {
        i = {
          # 将水平分屏 (Split) 改为 Alt-S
          "<A-s>" = {__raw = "require('telescope.actions').file_split";};
          # 将垂直分屏 (Vsplit) 改为 Alt-V
          "<A-v>" = {__raw = "require('telescope.actions').file_vsplit";};
          # 将新标签页 (Tab) 改为 Alt-T
          "<A-t>" = {__raw = "require('telescope.actions').file_tab";};
        };
        n = {
          # 将水平分屏 (Split) 改为 Alt-S
          "<A-s>" = {__raw = "require('telescope.actions').file_split";};
          # 将垂直分屏 (Vsplit) 改为 Alt-V
          "<A-v>" = {__raw = "require('telescope.actions').file_vsplit";};
          # 将新标签页 (Tab) 改为 Alt-T
          "<A-t>" = {__raw = "require('telescope.actions').file_tab";};
        };
      };
    };
  };

  keymaps = [
    {
      action = "<CMD>Telescope projects layout_config={height=0.6,width=0.6}<CR>";
      key = "<leader>fp";
      options = {
        silent = true;
        desc = "切换项目";
      };
    }
    {
      action = "<CMD>Telescope find_files theme=dropdown previewer=false layout_config={height=0.3}<CR>";
      key = "<leader>ff";
      options = {
        silent = true;
        desc = "查找文件";
      };
    }
    {
      action = "<CMD>Telescope grep_string theme=ivy layout_config={height=0.4}<CR>";
      key = "<leader>fs";
      options = {
        silent = true;
        desc = "字符快搜";
      };
    }
    {
      action = "<CMD>Telescope live_grep theme=ivy layout_config={height=0.4}<CR>";
      key = "<leader>fg";
      options = {
        silent = true;
        desc = "全局搜索";
      };
    }
    {
      action = "<CMD>Telescope buffers layout_config={mirror=true,prompt_position=top,height=0.4,width=0.6} layout_strategy=vertical previewer=false<CR>";
      key = "<leader>fb";
      options = {
        silent = true;
        desc = "查看缓冲区";
      };
    }
    {
      action = "<CMD>Telescope oldfiles theme=dropdown previewer=false layout_config={height=0.3}<CR>";
      key = "<leader>fo";
      options = {
        silent = true;
        desc = "历史文件";
      };
    }
    {
      action = "<CMD>Telescope live_grep_args theme=ivy layout_config={height=0.4}<CR>";
      key = "<leader>fr";
      options = {
        silent = true;
        desc = "高级搜索";
      };
    }
    {
      action = "<CMD>Telescope keymaps layout_config={width=0.8}<CR>";
      key = "<leader>fk";
      options = {
        silent = true;
        desc = "快捷键查询";
      };
    }
    {
      action = "<CMD>Telescope help_tags theme=ivy layout_config={height=0.4}<CR>";
      key = "<leader>H";
      options = {
        silent = true;
        desc = "帮助查询";
      };
    }
  ];
}
