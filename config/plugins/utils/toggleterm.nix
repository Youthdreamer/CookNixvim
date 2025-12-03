{
  plugins.toggleterm.enable = true;
  plugins.toggleterm.lazyLoad = {
    enable = true;
    settings = {
      cmd = "ToggleTerm";
    };
  };
  plugins.toggleterm.settings = {
    size = ''
      function(term)
        if term.direction == "horizontal" then
          return 8
        elseif term.direction == "vertical" then
          return vim.o.columns * 0.4
        end
      end
    '';
    open_mapping = "[[<C-\\>]]";
    persist_size = true; # 记住你的终端窗口大小
    direction = "float"; # 默认方向：'vertical'（垂直分割）; 'horizontal'（水平分割）; 'float'（浮动窗口）; 'tab'（新标签页）
    term_width = 120; # 可以为不同的方向指定宽度
    term_high = 20;
    float_opts = {
      border = "single"; # 浮动窗口边框样式: 'single'; 'double';  'rounded'; 'none'; 'curved'; 'shadow'
      winblend = 0; # 浮动窗口的透明度 (0-100)
      height = 20;
      width = 80;
    };
  };
  keymaps = [
    {
      mode = "n";
      key = "<leader>tt";
      action = "<cmd>ToggleTerm<cr>";
      options = {
        silent = true;
        desc = "启用终端";
      };
    }
    {
      mode = "n";
      key = "<leader>tv";
      action = "<cmd>ToggleTerm direction=vertical<cr>";
      options = {
        silent = true;
        desc = "切换垂直终端窗口";
      };
    }
    {
      mode = "n";
      key = "<leader>th";
      action = "<cmd>ToggleTerm direction=horizontal<cr>";
      options = {
        silent = true;
        desc = "切换水平终端窗口";
      };
    }
    {
      mode = "n";
      key = "<leader>tf";
      action = "<cmd>ToggleTerm direction=float<cr>";
      options = {
        silent = true;
        desc = "切换浮动终端窗口";
      };
    }
    {
      mode = "t";
      key = "<esc>";
      action = "<C-\\><C-n>";
      options = {
        silent = true;
        desc = "终端退到Normal模式";
      };
    }
  ];
}
