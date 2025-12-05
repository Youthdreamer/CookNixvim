{
  plugins.colorizer.enable = true;
  plugins.colorizer.lazyLoad = {
    enable = true;
    settings = {
      ft = [
        "css"
        "html"
        "javascript"
        "javascriptreact"
        "typescript"
        "typescriptreact"
        "vue"
        "python"
        "ruby"
        "markdown"
      ];
    };
  };
  plugins.colorizer.settings = {
    # 支持所有文件类型
    filetypes = ["*"];
    # 启用用户命令 (如 :ColorizerToggle)
    user_commands = true;
    lazy_load = false;
    user_default_options = {
      names = false; # 启用 CSS 颜色名称（如 red、blue）
      # 名称处理选项
      names_opts = {
        lowercase = true; # 高亮小写颜色名
        camelcase = true; # 高亮大写开头颜色名
        uppercase = false; # 不高亮大写颜色名
        strip_digits = false; # 不忽略带数字的颜色名
      };
      # 启用常见的 HEX 颜色格式
      RGB = true; # #RGB
      RGBA = true; # #RGBA
      RRGGBB = true; # #RRGGBB
      RRGGBBAA = true; # #RRGGBBAA
      AARRGGBB = false; # 0xAARRGGBB
      # 启用 CSS 颜色函数
      rgb_fn = true; # rgb(255;0;0)
      hsl_fn = true; # hsl(120; 100%; 50%)
      oklch_fn = false; # oklch(…)
      # 启用 Tailwind 颜色（从 LSP 提供的 Tailwind 类名获取）
      tailwind = "both"; # 'normal' 使用内置，'lsp' 使用 LSP 提供的，'both' 两者合并
      tailwind_opts = {
        update_names = true; # 启用 LSP 动态更新 Tailwind 颜色名
      };
      # 启用 Sass 支持
      sass = {
        enable = true;
        parsers = ["css"];
      };
      # 启用 xterm256 颜色支持
      xterm = false;
      # 高亮显示模式
      mode = "virtualtext"; # 背景色高亮
      # 使用 virtualtext 时显示的方块字符
      virtualtext = "■";
      # 虚拟文本显示位置
      virtualtext_inline = false;
      # 虚拟文本颜色模式
      virtualtext_mode = "foreground";
      # 即使 buffer 不聚焦也更新颜色（如 cmp 弹窗）
      always_update = false;
      # hooks 控制高亮行为
      hooks = {
        disable_line_highlight = false; # 禁用某一行高亮
      };
    };
  };
}
