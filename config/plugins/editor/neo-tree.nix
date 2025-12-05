{
  plugins.neo-tree.enable = true;
  plugins.neo-tree.lazyLoad = {
    enable = true;
    settings = {
      cmd = "Neotree";
    };
  };
  plugins.neo-tree.settings = {
    window = {
      width = 30;
      mappings = {
        "<space>" = "none";
      };
    };
    enable = true;
    add_blank_line_at_top = false;
    filesystem = {
      bind_to_cwd = false;
      follow_current_file = {
        enabled = true;
        leave_dirs_open = true;
      };
      group_empty_dirs = true; # 将空目录合并显示
      hijack_netrw = true; # 接管 Neovim 内置的 netrw
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
    };
  };

  keymaps = [
    {
      mode = ["n"];
      key = "<leader>e";
      action = "<cmd>Neotree toggle reveal_force_cwd<cr>";
      options = {
        silent = true;
        desc = "Open/Close Neotree";
      };
    }
  ];
}
