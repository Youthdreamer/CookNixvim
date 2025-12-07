{
  autoGroups = {
    highlight-yank = {
      clear = true; # 创建组并清除旧命令
    };
  };
  autoCmd = [
    {
      desc = "取消自动换行注释";
      event = "FileType";
      pattern = "*";
      callback = {
        __raw = ''
           function()
           vim.opt_local.formatoptions:remove({ "c", "r" })
          end'';
      };
    }

    {
      desc = "自动保存当前缓冲区或切换缓冲区时保存";
      event = [
        "BufLeave"
        "FocusLost"
      ];
      pattern = "*";
      callback = {
        __raw = ''
           function()
             if vim.bo.buftype == "" and vim.bo.modified and vim.fn.expand("%") ~= "" then
            local success, err = pcall(function()
               vim.cmd("write")
            end)

            if not success then
             vim.notify("保存文件时出错: " .. err, vim.log.levels.ERROR)
            end
           end
          end'';
      };
    }

    {
      desc = "tab大小控制";
      event = "TextYankPost";
      pattern = "*";
      group = "highlight-yank";
      callback = {
        __raw = ''
          function()
            vim.highlight.on_yank({ timeout = 500 })
          end
        '';
      };
    }

    {
      desc = "部分文档文件开启自动软换行";
      event = "FileType";
      pattern = ["markdown" "md" "text"];
      callback = {
        __raw = ''
          function()
            vim.opt_local.wrap = true
            vim.opt_local.linebreak = true
          end
        '';
      };
    }

    # {
    #    desc = "保存格式化";
    #    event = "BufWritePre";
    #    pattern = "*";
    #    callback = {
    #      __raw = ''
    #        function()
    #          vim.lsp.buf.format()
    #        end
    #      '';
    #    };
    # }

    {
      desc = "复制高亮";
      event = "TextYankPost";
      pattern = "*";
      group = "highlight-yank";
      callback = {
        __raw = ''
          function()
            vim.highlight.on_yank({ timeout = 500 })
          end
        '';
      };
    }

    {
      desc = "nocie背景颜色设置";
      event = "ColorScheme";
      pattern = "*";
      callback = {
        __raw = ''
          function()
            local bg = vim.api.nvim_get_hl_by_name("Normal", true).background
            if bg then
              bg = string.format("#%06x", bg)
            else
              bg = "#000000"
            end
            vim.cmd("highlight NotifyBackground guibg=" .. bg)
          end
        '';
      };
    }

    {
      desc = "在neovim退出前，关闭掉一些会话恢复会出问题的窗口";
      event = "VimLeavePre";
      callback = {
        __raw = ''
          function()
            pcall(vim.cmd, "Neotree close")
            pcall(vim.cmd, "AerialClose")
            pcall(vim.cmd, "Trouble close")

            local ok, dapui = pcall(require, "dapui")
            if ok then
              dapui.close()  -- 关闭所有 dap-ui 窗口
            end
          end
        '';
      };
    }

    {
      desc = "mini-indentscope排除首页的缩进线";
      event = "FileType";
      pattern = ["dashboard" "alpha" "snacks_dashboard"];
      once = true;
      callback = {
        __raw = ''
          function()
            vim.b.miniindentscope_disable = true
          end
        '';
      };
    }

    {
      desc = "自定义事件CookLazy";
      event = "VimEnter";
      once = true;
      callback = {
        __raw = ''
          function()
            vim.schedule(function()
              vim.api.nvim_exec_autocmds("User", { pattern = "CookLazy" })
            end)
          end
        '';
      };
    }

    {
      desc = "自定义事件LazyFile";
      event = ["BufReadPost" "BufNewFile"];
      once = true;
      callback = {
        __raw = ''
          function()
            -- 避免重复触发
            if not vim.g._lazyfile_triggered then
              vim.g._lazyfile_triggered = true
              -- 异步调度，保证其他 BufReadPost 回调先执行
              vim.schedule(function()
                vim.api.nvim_exec_autocmds("User", { pattern = "LazyFile" })
              end)
            end
          end
        '';
      };
    }
  ];
}
