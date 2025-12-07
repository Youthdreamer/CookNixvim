{
  plugins.which-key.enable = true;
  plugins.which-key.lazyLoad = {
    settings = {
      keys = ["<leader>"];
    };
  };
  plugins.which-key.settings = {
    preset = "helix";
    spec = [
      {
        __unkeyed-1 = "<leader>f";
        group = "文件查找";
        icon = "󰈞";
        mode = "n";
      }

      {
        __unkeyed-1 = "<leader>c";
        group = "lsp操作";
        icon = "";
        mode = "n";
      }
      # 调试
      {
        __unkeyed-1 = "<leader>d";
        group = "调试";
        icon = "";
        mode = "n";
      }
      {
        __unkeyed-1 = "<leader>dc";
        desc = "启动 / 继续调试";
        icon = "▶ ";
      }
      {
        __unkeyed-1 = "<leader>db";
        desc = "切换断点";
        icon = "● ";
      }
      {
        __unkeyed-1 = "<leader>dx";
        desc = "终止调试";
        icon = "■ ";
      }

      {
        __unkeyed-1 = "<leader>g";
        group = "Git";
        icon = "";
        mode = "n";
      }

      {
        __unkeyed-1 = "<leader>t";
        group = "终端操作";
        icon = "";
        mode = "n";
      }

      {
        __unkeyed-1 = "<leader>m";
        group = "文件标记跳转";
        icon = "󰃀";
        mode = "n";
      }

      {
        __unkeyed-1 = "<leader>T";
        group = "主题切换";
        icon = "";
        mode = "n";
      }

      {
        __unkeyed-1 = "<leader>b";
        group = "缓冲区操作";
        icon = "";
        mode = "n";
      }

      {
        __unkeyed-1 = "<leader>w";
        group = "窗口移动";
        icon = "";
        mode = "n";
      }

      {
        __unkeyed-1 = "<leader>h";
        group = "Git Hunk/代码块修改";
        icon = "";
        mode = "n";
      }

      {
        __unkeyed-1 = "<leader><tab>";
        group = "tab管理";
        icon = "󰓩";
        mode = "n";
      }

      {
        __unkeyed-1 = "<leader>e";
        group = "Neotree";
        icon = "“";
        mode = "n";
      }

      {
        __unkeyed-1 = "<leader>H";
        group = "帮助查询";
        icon = "";
        mode = "n";
      }

      {
        __unkeyed-1 = "<leader>D";
        group = "诊断浮窗";
        icon = "";
        mode = "n";
      }

      {
        __unkeyed-1 = "<leader>x";
        group = "问题查看";
        icon = "";
        mode = "n";
      }

      {
        __unkeyed-1 = "<leader>q";
        group = "退出编辑器";
        icon = "󰩈";
        mode = "n";
      }

      {
        __unkeyed-1 = "<leader>p";
        group = "Markdown内容预览";
        icon = "󰍔";
        mode = "n";
      }
    ];
  };
}
