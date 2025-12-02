{lib, ...}: {
  plugins.blink-cmp = {
    enable = true;
    setupLspCapabilities = false;
  };
  plugins.blink-cmp.lazyLoad = {
    settings = {
      event = [
        "InsertEnter"
        "CmdlineEnter"
      ];
    };
  };
  plugins.blink-cmp.settings.keymap = {
    preset = "super-tab";
    "<CR>" = [
      "accept"
      "fallback"
    ];
  };

  plugins.blink-cmp.settings.completion = {
    # ghost_text.enabled = true; # 代码补全内联提示（更改变量有点干扰不推荐）
    menu = {
      enabled = true;
      border = "rounded";
    };
    documentation = {
      auto_show = true;
      window = {
        border = "rounded";
      };
    };
  };

  plugins.blink-cmp.settings.signature = {
    enabled = true;
    window = {
      border = "rounded";
    };
  };

  plugins.blink-cmp.settings.sources = {
    default = [
      "lsp"
      "path"
      "snippets"
      "buffer"
    ];
  };

  plugins.blink-cmp.settings.cmdline = {
    completion = {
      menu = {
        auto_show = true;
      };
    };
    sources = lib.nixvim.mkRaw ''
      function()
        local type = vim.fn.getcmdtype()
        -- Search forward and backward
        if type == '/' or type == '?' then return { 'buffer' } end
        -- Commands
        if type == ':' then return { 'cmdline' } end
        return {}
      end
    '';
    keymap = {
      preset = "super-tab";
    };
  };
}
