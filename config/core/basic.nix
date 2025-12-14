{
  # 剪切复制
  clipboard = {
    register = "unnamedplus";
    providers.wl-copy.enable = true;
  };

  # NOTE: 开启这个配置，使得支持osc52的终端能够在ssh链接使用该neovim时可以将neovim的内容复制到系统剪切板中
  # 支持osc52的终端 Windows Terminal, kitty, wezterm, iTerm2, alacritty等
  extraConfigLua = ''
    local function paste()
      -- 从默认寄存器 "" 中获取内容，并按换行符分割
      return {
        vim.fn.split(vim.fn.getreg(""), "\n"),
        vim.fn.getregtype(""), -- 同时返回寄存器类型
      }
    end
    vim.g.clipboard = {
      name = 'OSC 52',
      copy = {
        ['+'] = require('vim.ui.clipboard.osc52').copy('+'),
        ['*'] = require('vim.ui.clipboard.osc52').copy('*'),
      },
      paste = {
        ['+'] = paste,
        ['*'] = paste,
      },
    }
  '';

  opts = {
    # --- 行号 ---
    number = true; # 显示行号
    relativenumber = true; # 显示相对行号
    cursorline = true; # 启动光标行高亮

    winborder = "rounded"; # 浮窗边框
    signcolumn = "yes"; # 永远显示 sign column（诊断标记）

    # --- 编码与换行 ---
    fileformat = "unix"; # 设置文件默认保存格式为 Unix (LF)
    fileformats = ["unix" "dos" "mac"]; # 文件格式检测优先级
    wrap = false; # 不换行显示
    # colorcolumn = "80,120"; # 标记列 80 和 120

    # --- 搜索 ---
    ignorecase = true; # 搜索忽略大小写
    smartcase = true; # 如果包含大写字符，则区分大小写
    hlsearch = false; # 高亮搜索结果
    incsearch = true; # 增量搜索

    # --- 缩进 ---
    tabstop = 2; # Tab 长度为 2
    shiftwidth = 2; # 缩进长度为 2
    expandtab = true; # 将 Tab 替换为空格
    autoindent = true; # 自动缩进
    smartindent = true; # 智能缩进

    # --- 界面 ---
    termguicolors = true; # 启用真色彩
    laststatus = 2; # 禁用底部状态栏（实际上 2 是总是显示）

    # --- 滚动与位置 ---
    scrolloff = 5; # 上下滚动时保留 5 行缓冲
    sidescrolloff = 5; # 左右滚动时保留 5 列缓冲

    # --- 功能 ---
    undofile = true; # 启用持久撤销
    clipboard = "unnamedplus"; # 共享系统剪切板

    # --- 代码折叠 ---

    foldmethod = "expr"; # 折叠方法设置为表达式
    # foldexpr = "nvim_treesitter#foldexpr()"; # 使用 Treesitter 的表达式
    foldexpr = "v:lua.vim.ufo.foldexpr()"; # 使用 Treesitter 的表达式
    fillchars = {
      foldopen = ""; # 折叠打开图标
      foldclose = ""; # 折叠关闭图标
      fold = " "; # 折叠填充字符
      foldsep = " "; # 折叠分隔符
      diff = "╱"; # diff 填充字符
      eob = " "; # 行尾空白字符
    };
    foldenable = true;
    foldlevelstart = 99; # 默认展开所有
    sessionoptions = [
      "buffers"
      "curdir"
      "tabpages"
      "winsize"
      "help"
      "globals"
      "skiprtp"
      "folds"
    ];
  };
}
