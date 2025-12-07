{
  plugins.lualine.enable = true;
  plugins.lualine.lazyLoad = {
    settings = {
      event = ["User LazyFile"];
    };
  };
  plugins.lualine.settings = {
    options = {
      disabled_filetypes = {
        statusline = [
          "dashboard"
          "alpha"
          "starter"
          "neo-tree"
          "mini-files"
          "dap-repl"
        ]; # 禁用 statusline 的文件类型
        winbar = [
          "aerial"
          "dap-repl"
          "neotest-summary"
        ]; # 禁用 winbar 的文件类型
      };
      section_separators = "";
      component_separators = "";
      globalstatus = true;
    };
  };

  plugins.lualine.settings.sections = {
    lualine_c = [
      {
        __unkeyed-1 = "filename";
        path = 1;
      }
    ];
    lualine_x = [
      {
        __raw = ''
          function()
            local ft = vim.bo.filetype
            local ts = vim.bo.tabstop
            local sw = vim.bo.shiftwidth
            local et = vim.bo.expandtab and "spaces" or "tab"
            -- 对go语言特别处理
            if ft == "go" then
              return string.format("tab:%d", ts)
            end

            if et then
              return string.format("spaces:%d", sw)
            else
              return string.format("tab:%d", ts)
            end
          end
        '';
      }
      "encoding"
      {
        __raw = ''
          function()
            local f = vim.bo.fileformat
            if f == "unix" then
              return "LF"
            elseif f == "dos" then
              return "CRLF"
            elseif f == "mac" then
              return "CR"
            else
              return f
            end
          end
        '';
      }
      "fileformat"
      "filetype"
    ];
  };
}
