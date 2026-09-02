# NOTE: GitHub插件安装配置示例（含使用lz.n懒加载插件）
# NOTE:本插件作为示例默认开启，原因是本人会使用这个插件所以默认保持启用。
# 这是我编写的插件obsess，地址：https://github.com/Youthdreamer/obsess
# 它提供了一个简单的倒计时定时器和任务管理功能，所有内容显示在一个浮动窗口中
# 如果你不需要可以更换为其他GitHub插件或者删除该文件("which-key.nix"与"autocmd.nix"中的相关设置也应该删除)
# 该插件，使用neovim提供的api不依赖其他插件。
{pkgs, ...}: {
  extraPlugins = [
    (pkgs.vimUtils.buildVimPlugin {
      name = "obsess";
      src = pkgs.fetchFromGitHub {
        owner = "Youthdreamer";
        repo = "obsess";
        rev = "8c0a79d611b328f55f506806cdfbae5c972b7bbc";
        hash = "sha256-5dibZ0VNUmKvH8peby5JiT+aLKAsJ9J83cYrU0VmA2k=";
      };
    })
  ];
  extraConfigLua = ''
    local opts = {
      position = "top-right",
      window = {
        width  = 30,
        height = 10,
        title  = "Obsess",
      },
      -- 倒计时结束后的弹窗提醒设置
      flash = {
        times = 10,         -- 闪烁次数
        interval_ms = 200, -- 每次间隔时间
      },
    }
    -- 懒加载
    require("lz.n").load {
      {
        "obsess",
        cmd = {
          "ObsessToggle", "ObsessClose", "ObsessTimer", "ObsessTimerSec",
          "ObsessTaskAdd", "ObsessTaskClear", "ObsessTaskDel", "ObsessTaskDone",
          "ObsessTaskLoad"
        },
        after = function()
          require("obsess").setup(opts)
        end,
      }
    }
    -- require('obsess').setup(opts)
  '';

  keymaps = [
    {
      mode = "n";
      key = "<leader>ot";
      action = "<cmd>ObsessTimer<cr>";
      options = {
        silent = true;
        desc = "设置定时器(分)";
      };
    }
    {
      mode = "n";
      key = "<leader>os";
      action = "<cmd>ObsessTimerSec<cr>";
      options = {
        silent = true;
        desc = "设置定时器(秒)";
      };
    }
    {
      mode = "n";
      key = "<leader>ow";
      action = "<cmd>ObsessToggle<cr>";
      options = {
        silent = true;
        desc = "显示/隐藏窗口";
      };
    }
    {
      mode = "n";
      key = "<leader>oc";
      action = "<cmd>ObsessClose<cr>";
      options = {
        silent = true;
        desc = "关闭窗口并停止计时";
      };
    }
    {
      mode = "n";
      key = "<leader>oa";
      action = "<cmd>ObsessTaskAdd<cr>";
      options = {
        silent = true;
        desc = "添加任务";
      };
    }
    {
      mode = "n";
      key = "<leader>ox";
      action = "<cmd>ObsessTaskDone<cr>";
      options = {
        silent = true;
        desc = "切换任务状态";
      };
    }
    {
      mode = "n";
      key = "<leader>od";
      action = "<cmd>ObsessTaskDel<cr>";
      options = {
        silent = true;
        desc = "删除任务";
      };
    }
    {
      mode = "n";
      key = "<leader>oe";
      action = "<cmd>ObsessTaskClear<cr>";
      options = {
        silent = true;
        desc = "清空任务列表";
      };
    }
    {
      mode = "n";
      key = "<leader>ol";
      action = "<cmd>ObsessTaskLoad<cr>";
      options = {
        silent = true;
        desc = "加载任务面板";
      };
    }
  ];
}
