{
  plugins.bufferline.enable = true;
  plugins.bufferline.lazyLoad = {
    enable = true;
    settings = {
      event = ["VimEnter"];
    };
  };
  plugins.bufferline.settings = {
    options = {
      indicator = {
        style = "underline";
        # icon = "▎";
        # style = "icon";
      };

      buffer_close_icons = "⨉ "; # 关闭 buffer 的图标
      close_icon = "⨉  "; # Tabline 右侧的关闭所有 buffer 图标
      modified_icon = "●"; # 未保存文件的修改指示器图标
      left_trunc_marker = ""; # 左侧截断标记
      right_trunc_marker = ""; # 右侧截断标记
      max_average_window_width = 100; # 平均窗口宽度限制，防止 buffer 过多时挤压
      diagnostics = "nvim_lsp"; # 显示 LSP 诊断信息，可选 "nvim_lsp", "coc", "default"
      diagnostics_indicator = ''
        function(count, level)
          -- 自定义诊断图标和颜色
          local icon = level:match("error") and " " or " "
          return " " .. icon .. count
        end
      '';

      offsets = [
        {
          filetype = "neo-tree"; # Neo-tree 的文件类型
          text = "Bug Hell Portal";
          text_align = "left";
        }
      ];

      show_buffer_close_icons = true; # 是否显示每个 buffer 上的关闭图标
      show_close_icon = true; # 是否显示 Tabline 右侧的关闭所有 buffer 图标
      show_tab_indicators = true; # 是否显示 Tabline 上方的指示器
      enforce_regular_tabs = true; # 强制使用常规标签页样式
      always_show_bufferline = true; # 总是显示 bufferline，即使只有一个 buffer
      sort_by = "insert_after_current"; # buffer 排序方式，可选 "insert_after_current", "id", "extension", "relative_directory", "tabs"
      numbers = "none"; # buffer 编号显示，可选 "none", "ordinal", "buffer_id", "custom"
    };
  };

  keymaps = [
    {
      mode = "n";
      key = "]b";
      action = "<cmd>BufferLineCycleNext<cr>";
      options = {
        desc = "切换到下一个缓冲区";
      };
    }

    {
      mode = "n";
      key = "[b";
      action = "<cmd>BufferLineCyclePrev<cr>";
      options = {
        desc = "切换到上一个缓冲区";
      };
    }

    {
      mode = "n";
      key = "<leader>bb";
      action = "<CMD>e #<CR>";
      options = {
        desc = "快速切换缓冲区";
      };
    }

    {
      mode = "n";
      key = "<leader>bf";
      action = "<cmd>BufferLinePick<cr>";
      options = {
        desc = "查询并跳转缓冲区";
      };
    }

    {
      mode = "n";
      key = "<leader>bd";
      action = "<cmd>bdelete<cr>";
      options = {
        desc = "删除缓冲区";
      };
    }

    {
      mode = "n";
      key = "<leader>bo";
      action = "<cmd>BufferLineCloseOthers<cr>";
      options = {
        desc = "删除其他缓冲区";
      };
    }

    {
      mode = "n";
      key = "<leader>bp";
      action = "<cmd>BufferLineTogglePin<cr>";
      options = {
        desc = "切换缓冲区固定状态";
      };
    }

    {
      mode = "n";
      key = "<leader>bP";
      action = "<Cmd>BufferLineGroupClose ungrouped<CR>";
      options = {
        desc = "删除未固定的缓冲区";
      };
    }
  ];
}
