{
  plugins.telescope = {
    settings = {
      defaults = {
        ivy = {
          height = 0.30;
        };
      };
    };
    lazyLoad = {
      enable = true;
      settings.cmd = "Telescope";
    };
    enable = true;
    extensions = {
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
  };

  keymaps = [
    {
      action = "<CMD>Telescope projects<CR>";
      key = "<leader>fp";
      options = {
        silent = true;
        desc = "切换项目";
      };
    }
    {
      action = "<CMD>Telescope find_files theme=dropdown previewer=false<CR>";
      key = "<leader>ff";
      options = {
        silent = true;
        desc = "查找文件";
      };
    }
    {
      action = "<CMD>Telescope grep_string theme=ivy<CR>";
      key = "<leader>fs";
      options = {
        silent = true;
        desc = "字符快搜";
      };
    }
    {
      action = "<CMD>Telescope live_grep<CR>";
      key = "<leader>fg";
      options = {
        silent = true;
        desc = "全局搜索";
      };
    }
    {
      action = "<CMD>Telescope buffers<CR>";
      key = "<leader>fb";
      options = {
        silent = true;
        desc = "查看缓冲区";
      };
    }
    {
      action = "<CMD>Telescope oldfiles theme=dropdown previewer=false<CR>";
      key = "<leader>fo";
      options = {
        silent = true;
        desc = "历史文件";
      };
    }
    {
      action = "<CMD>Telescope live_grep_args<CR>";
      key = "<leader>fr";
      options = {
        silent = true;
        desc = "高级搜索";
      };
    }
    {
      action = "<CMD>Telescope keymaps<CR>";
      key = "<leader>fk";
      options = {
        silent = true;
        desc = "快捷键查询";
      };
    }
  ];
}
