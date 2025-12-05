{
  plugins.trouble.enable = true;
  plugins.trouble.lazyLoad = {
    settings.cmd = "Trouble";
  };
  keymaps = [
    #打开/关闭TODO查询面板
    {
      action = "<cmd>TodoTrouble toggle<cr>";
      key = "<leader>xt";
      options = {
        silent = true;
        desc = "切换TODO面板 (Trouble)";
      };
    }

    #打开/关闭诊断面板
    {
      action = "<cmd>Trouble diagnostics toggle<cr>";
      key = "<leader>xx";
      options = {
        silent = true;
        desc = "切换诊断面板 (Trouble)";
      };
    }

    # 仅显示当前缓冲区的诊断面板
    {
      action = "<cmd>Trouble diagnostics toggle filter.buf=0<cr>";
      key = "<leader>xX";
      options = {
        silent = true;
        desc = "切换当前缓冲区的诊断面板 (Trouble)";
      };
    }

    # 打开/关闭 LSP 定义、引用等面板
    {
      action = "<cmd>Trouble lsp toggle focus=false win.position=right<cr>";
      key = "<leader>cl";
      options = {
        silent = true;
        desc = "切换 LSP 定义/引用面板 (Trouble)";
      };
    }

    # 打开/关闭位置列表（Location List）面板
    {
      action = "<cmd>Trouble loclist toggle<cr>";
      key = "<leader>xL";
      options = {
        silent = true;
        desc = "切换位置列表面板 (Trouble)";
      };
    }

    # 打开/关闭 quickfix 列表面板
    {
      action = "<cmd>Trouble qflist toggle<cr>";
      key = "<leader>xQ";
      options = {
        silent = true;
        desc = "切换 quickfix 列表面板 (Trouble)";
      };
    }

    {
      action.__raw = ''
        function()
        	if require("trouble").is_open() then
        		require("trouble").previous({ skip_groups = true, jump = true })
        	else
        		vim.cmd.cprev()
        	end
        end
      '';
      key = "[q";
      options = {
        silent = true;
        desc = "上一个故障/快速修复项目";
      };
    }

    {
      action.__raw = ''
        function()
        	if require("trouble").is_open() then
        		require("trouble").previous({ skip_groups = true, jump = true })
        	else
            vim.cmd.cnext()
        	end
        end
      '';
      key = "]q";
      options = {
        silent = true;
        desc = "下一个故障/快速修复项目";
      };
    }
  ];
}
