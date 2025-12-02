{
  plugins.neo-tree.enable = true;
  plugins.neo-tree.lazyLoad = {
    enable = true;
    settings.cmd = "Neotree";
  };
  plugins.neo-tree.settings = {
    enable = true;
    add_blank_line_at_top = false;

    filesystem = {
      bind_to_cwd = false;
      follow_current_file = {
        enabled = true;
        leave_dirs_open = true;
      };
    };

    default_component_configs = {
      indent = {
        with_expanders = true;
        expander_collapsed = "󰅂";
        expander_expanded = "󰅀";
        expander_highlight = "NeoTreeExpander";
      };

      git_status = {
        symbols = {
          added = " "; # 新增
          modified = "  "; # 修改
          deleted = "󱂥 "; # 删除
          renamed = "󰑕 "; # 重命名
          untracked = " "; # 未跟踪
          unstaged = " "; # 未暂存
          staged = "󰩍 "; # 已暂存
          ignored = "  "; # 忽略
          conflict = " "; # 冲突（更醒目）
        };
      };

      window = {
        width = 20;
        mappings = {
          "<space>" = "none";
        };
      };
    };
  };

  keymaps = [
    {
      mode = ["n"];
      key = "<leader>e";
      action = "<cmd>Neotree toggle<cr>";
      options = {
        desc = "Open/Close Neotree";
      };
    }
  ];
}
