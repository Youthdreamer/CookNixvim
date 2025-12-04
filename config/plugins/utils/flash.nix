{
  plugins.flash.enable = true;
  plugins.flash.lazyLoad = {
    enable = true;
    settings = {
      event = "User CookLazy";
    };
  };
  keymaps = [
    # 普通 / 可视 / 操作模式下 jump
    {
      mode = ["n" "x" "o"];
      action.__raw = ''
        function()
          require("flash").jump()
        end
      '';
      key = "s";
      options = {
        silent = true;
        desc = "flash跳转";
      };
    }
    # Treesitter 模式选择节点
    {
      mode = ["n" "x" "o"];
      action.__raw = ''
        function()
          require("flash").treesitter()
        end
      '';
      key = "S";
      options = {
        silent = true;
        desc = "flash Treesitter跳转";
      };
    }
    # Operator-pending 远程跳转
    {
      mode = "o";
      action.__raw = ''
        function()
          require("flash").remote()
        end
      '';
      key = "r";
      options = {
        silent = true;
        desc = "远程跳转";
      };
    }
    {
      mode = ["o" "x"];
      action.__raw = ''
        function()
          require("flash").treesitter_search()
        end
      '';
      key = "R";
      options = {
        silent = true;
        desc = "treesitter搜索";
      };
    }
    # 跳转行
    {
      mode = ["o" "n" "x"];
      action.__raw = ''
        function()
          require("flash").jump({
            search = { mode = "search", max_length = 0 },
            label = { after = { 0, 0 } },
            pattern = "^"
          })
        end
      '';
      key = "gl";
      options = {
        silent = true;
        desc = "跳转行";
      };
    }
    # 插入 / 命令模式切换 Flash search
    {
      mode = ["i" "c"];
      action.__raw = ''
        function()
          require("flash").toggle()
        end
      '';
      key = "<C-S>";
      options = {
        silent = true;
        desc = "切换 Flash 搜索";
      };
    }
  ];
}
