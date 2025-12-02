# 代码折叠
{
  plugins.nvim-ufo = {
    enable = true;
  };
  plugins.nvim-ufo.lazyLoad = {
    settings = {
      event = ["BufReadPost"];
    };
  };
  plugins.nvim-ufo.setupLspCapabilities = true;
  plugins.nvim-ufo.settings = {
    fold_virt_text_handler = ''
      function(virtText, lnum, endLnum, width, truncate)
          local newVirtText = {}
          local suffix = (" 󰁂 %d "):format(endLnum - lnum) -- 折叠行数
          local sufWidth = vim.fn.strdisplaywidth(suffix)
          local targetWidth = width - sufWidth
          local curWidth = 0

          -- 保留原始缩进
          for _, chunk in ipairs(virtText) do
            local chunkText = chunk[1]
            local chunkWidth = vim.fn.strdisplaywidth(chunkText)
            if targetWidth > curWidth + chunkWidth then
              table.insert(newVirtText, chunk)
            else
              chunkText = truncate(chunkText, targetWidth - curWidth)
              local hlGroup = chunk[2]
              table.insert(newVirtText, { chunkText, hlGroup })
              chunkWidth = vim.fn.strdisplaywidth(chunkText)
              if curWidth + chunkWidth < targetWidth then
                suffix = suffix .. (" "):rep(targetWidth - curWidth - chunkWidth)
              end
              break
            end
            curWidth = curWidth + chunkWidth
          end

          -- 添加折叠信息到行尾（类似 VSCode）
          table.insert(newVirtText, { suffix, "Comment" })
          return newVirtText
      end
    '';
    provider_selector = ''
      function(bufnr, filetype, buftype)
        return { "treesitter", "indent" } -- 优先 treesitter
      end
    '';
    preview = {
      mappings = {
        scrollU = "<C-u>";
        scrollD = "<C-d>";
        jumpTop = "[";
        jumpBot = "]";
      };
    };
  };

  keymaps = [
    {
      action.__raw = ''
        function()
          require("ufo").openAllFolds()
        end
      '';
      key = "zR";
      options = {
        silent = true;
        desc = "折叠全部代码";
      };
      mode = "n";
    }
    {
      action.__raw = ''
        function()
          require("ufo").closeAllFolds()
        end
      '';
      key = "zM";
      options = {
        silent = true;
        desc = "打开全部代码";
      };
      mode = "n";
    }
    {
      action.__raw = ''
        function()
          local winid = require("ufo").peekFoldedLinesUnderCursor()
          if not winid then
        	  vim.lsp.buf.hover()
          end
        end
      '';
      key = "K";
      options = {
        silent = true;
        desc = "查看折叠代码";
      };
      mode = "n";
    }
  ];
}
