{
  plugins.gitsigns.enable = true;
  plugins.gitsigns.lazyLoad = {
    enable = true;
    settings = {
      event = ["User LazyFile"];
    };
  };
  plugins.gitsigns.settings = {
    signs = {
      add = {
        text = "│";
      };
      change = {
        text = "│";
      }; 
      changedelete = {
        text = "~";
      };
      delete = {
        text = "_";
      };
      topdelete = {
        text = "‾";
      };
      untracked = {
        text = "┆";
      };
    };

    current_line_blame = true; # 默认不在当前行显示 Git blame 信息，可以通过快捷键切换
    current_line_blame_opts = {
      virt_text = true; # 使用虚拟文本显示 blame 信息
      virt_text_pos = "eol"; # 在行尾显示 blame 信息 ('eol' | 'overlay' | 'right_align')
      delay = 500; # 鼠标悬停显示 blame 信息的延迟（毫秒）
      ignore_whitespace = false;
      virt_text_priority = 100;
      use_focus = true;
    };
    preview_config = {
      # 预览 Hunk 时的浮动窗口配置
      style = "minimal";
      relative = "cursor";
      row = 0;
      col = 1;
    };
    on_attach = ''
      -- 键位映射 (Keymaps) - 只保留信息显示和导航相关的映射
      function(bufnr)
      	local gitsigns = require("gitsigns")

      	-- 辅助函数：简化键位映射的定义
      	local function map(mode, l, r, desc, opts)
      		opts = opts or {}
      		opts.buffer = bufnr -- 将映射绑定到当前缓冲区
      		if desc then
      			opts.desc = desc -- 添加描述，便于查看键位绑定
      		end
      		vim.keymap.set(mode, l, r, opts)
      	end

      	-- --- 导航 (Navigation) ---
      	-- 在 Hunk 之间跳转：
      	-- `]c` 跳转到下一个修改块 (hunk)
      	-- 如果在 diff 模式下，则使用 Neovim 原生 `]c` 跳转到下一个更改
      	map("n", "]c", function()
      		if vim.wo.diff then
      			vim.cmd.normal({ "]c", bang = true })
      		else
      			gitsigns.nav_hunk("next")
      		end
      	end, "跳转到下一个修改块")

      	-- `[c` 跳转到上一个修改块 (hunk)
      	-- 如果在 diff 模式下，则使用 Neovim 原生 `[c` 跳转到上一个更改
      	map("n", "[c", function()
      		if vim.wo.diff then
      			vim.cmd.normal({ "[c", bang = true })
      		else
      			gitsigns.nav_hunk("prev")
      		end
      	end, "跳转到上一个修改块")

      	-- --- 信息查看 (Information Viewing) ---
      	map("n", "<leader>hp", gitsigns.preview_hunk, "预览Hunk(弹窗)")
      	map("n", "<leader>hi", gitsigns.preview_hunk_inline, "行内预览Hunk")
      	map("n", "<leader>hb", function()
      		gitsigns.blame_line({ full = true })
      	end, "显示blame弹窗信息")
      	map("n", "<leader>hd", gitsigns.diffthis, "显示文件差异(索引)")
      	map("n", "<leader>hD", function()
      		gitsigns.diffthis("~") -- '~' 表示 HEAD 的父提交
      	end, "显示文件差异(HEAD)")
      	map("n", "<leader>hQ", function()
      		gitsigns.setqflist("all")
      	end, "所有Git变更到Quickfix")
      	map("n", "<leader>hq", gitsigns.setqflist, "当前文件变更到Quickfix")

      	-- --- 切换显示 (Toggles) ---
      	map("n", "<leader>ht", gitsigns.toggle_current_line_blame, "切换行内blame显示")
      	map("n", "<leader>hw", gitsigns.toggle_word_diff, "切换行内单词差异")

      	map({ "o", "x" }, "ih", gitsigns.select_hunk, "选择Git hunk")
      end
    '';
  };
}
