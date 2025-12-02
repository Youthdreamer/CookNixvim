{
  plugins.lualine.enable = true;
  plugins.lualine.lazyLoad = {
    settings = {
      event = ["BufReadPost"];
    };
  };
  plugins.lualine.settings = {
    disabled_filetypes = {
      statusline = []; # 禁用 statusline 的文件类型
      winbar = []; # 禁用 winbar 的文件类型
    };
  };

  plugins.lualine.settings.sections = {
    lualine_c = [
      {
        __unkeyed-1 = "filename";
        path = 1;
      }
    ];
  };
}
