{
  # 设置 leader
  globals = {
    mapleader = " ";
  };
  # --------------------
  # KEYMAPS
  # --------------------
  keymaps = [

    # j / k 改 gj / gk
    {
      mode = "n";
      key = "j";
      action = "v:count == 0 ? 'gj' : 'j'";
      options = {
        expr = true;
        silent = true;
      };
    }
    {
      mode = "n";
      key = "k";
      action = "v:count == 0 ? 'gk' : 'k'";
      options = {
        expr = true;
        silent = true;
      };
    }

    {
      mode = [
        "i"
        "n"
        "v"
        "s"
      ];
      key = "<C-s>";
      action = "<Cmd>w<CR>";
      options = {
        silent = true;
        desc = "保存文件";
      };
    }
    {
      mode = [
        "i"
        "n"
      ];
      key = "<C-a>";
      action = "<Cmd>normal! ggVG<CR>";
      options = {
        silent = true;
        desc = "全选操作";
      };
    }

    # 剪贴板复制
    {
      mode = "v";
      key = "<leader>Y";
      action = "\"+y";
      options = {
        desc = "复制到系统剪贴板";
      };
    }

    {
      mode = "v";
      key = "<leader>D";
      action = "\"+x";
      options = {
        noremap = true;
        silent = true;
        desc = "剪切";
      };
    }

    # 退出
    {
      mode = "n";
      key = "<leader>qq";
      action = "<cmd>wqa<cr>";
      options = {
        desc = "退出编辑器";
      };
    }

    # Resize 窗口
    {
      mode = "n";
      key = "<C-Up>";
      action = "<cmd>resize +2<cr>";
      options = {
        desc = "增加窗口高度";
      };
    }
    {
      mode = "n";
      key = "<C-Down>";
      action = "<cmd>resize -2<cr>";
      options = {
        desc = "减少窗口高度";
      };
    }
    {
      mode = "n";
      key = "<C-Left>";
      action = "<cmd>vertical resize -2<cr>";
      options = {
        desc = "增加窗口宽度";
      };
    }
    {
      mode = "n";
      key = "<C-Right>";
      action = "<cmd>vertical resize +2<cr>";
      options = {
        desc = "减少窗口宽度";
      };
    }

    # move windows
    {
      mode = "n";
      key = "<leader>wH";
      action = "<C-w>H";
      options = {
        silent = true;
        desc = "窗口移到左边";
      };
    }
    {
      mode = "n";
      key = "<leader>wJ";
      action = "<C-w>J";
      options = {
        silent = true;
        desc = "窗口移到底部";
      };
    }
    {
      mode = "n";
      key = "<leader>wK";
      action = "<C-w>K";
      options = {
        silent = true;
        desc = "窗口移到底部";
      };
    }
    {
      mode = "n";
      key = "<leader>wL";
      action = "<C-w>L";
      options = {
        silent = true;
        desc = "窗口移到右边";
      };
    }

    # 行移动
    {
      mode = "n";
      key = "<A-j>";
      action = ":m .+1<CR>==";
      options = {
        desc = "Move line down";
      };
    }
    {
      mode = "n";
      key = "<A-k>";
      action = ":m .-2<CR>==";
      options = {
        desc = "Move line up";
      };
    }
    {
      mode = "v";
      key = "<A-j>";
      action = ":m '>+1<CR>gv=gv";
      options = {
        desc = "Move selection down";
      };
    }
    {
      mode = "v";
      key = "<A-k>";
      action = ":m '<-2<CR>gv=gv";
      options = {
        desc = "Move selection up";
      };
    }

    # tab 管理
    {
      mode = "n";
      key = "<leader><tab><tab>";
      action = "<cmd>tabnew<CR>";
      options = {
        silent = true;
        desc = "新建标签页";
      };
    }
    {
      mode = "n";
      key = "<leader><tab>d";
      action = "<cmd>tabclose<CR>";
      options = {
        silent = true;
        desc = "关闭当前标签页";
      };
    }
    {
      mode = "n";
      key = "<leader><tab>o";
      action = "<cmd>tabonly<CR>";
      options = {
        silent = true;
        desc = "关闭其他标签页";
      };
    }
    {
      mode = "n";
      key = "<leader><tab>l";
      action = "<cmd>tabnext<CR>";
      options = {
        silent = true;
        desc = "切换到下一个标签页";
      };
    }
    {
      mode = "n";
      key = "<leader><tab>h";
      action = "<cmd>tabprevious<CR>";
      options = {
        silent = true;
        desc = "切换到上一个标签页";
      };
    }
  ];
}
