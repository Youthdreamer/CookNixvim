# CookNixvim

CookNixvim 是一个遵循“配置即基础设施”理念的 Nixvim 模块化方案。它不仅仅是一份 Neovim 配置，更是一个完整的、可重现的开发环境。

通过利用 Nix Flakes 的强大威力，CookNixvim 将复杂的 LSP 依赖、工具链以及插件管理封装为声明式的代码。无论你在哪台机器上，只需一行指令，即可瞬间“烹饪”出一致、稳定且功能完备的现代化编辑器体验。

> [!TIP]
> **零污染**：所有插件与工具依赖均由 Nix 隔离管理，不污染系统全局环境。  
> **二进制分发**：内置 Cachix 缓存支持，告别漫长的插件编译与构建等待。  
> **开箱即用**：深度集成常用语言服务器（LSP）与 UI 增强，专注于代码，而非折腾环境。

## 目录

- [安装使用说明](#安装使用说明)
- [项目目录结构](#目录结构)
- [部分快捷键说明](#部分快捷键说明)
- [LSP说明](#lsp-说明)
- [主题切换说明](#主题切换说明)
- [复制粘贴功能说明](#复制粘贴功能说明)
- [**重点必看！！！从Github安装插件**](#从Github安装插件)
- [**懒加载说明**](#懒加载说明)
- [启动速度说明](#启动速度说明)
- [文件内说明](#文件内说明)
- [Github Actions 说明](#github-actions-说明)
- [兼容性说明](#兼容性说明)
- [适用人群](#适用人群)
- [友情提示](#友情提示)

## 安装使用说明

> [!TIP]
> 请确保你提前安装了 [**`Nerd Font`**](https://www.nerdfonts.com/) 字体，否则**图标**可能会无法显示

> [!WARNING]
> **⚠️ 自定义安装用户请注意：不要盲目信任第三方缓存**
>
> 本配置中使用了 Cachix 管理缓存，为方便使用本配置的构建缓存，所以在 [`flake.nix`](./flake.nix) 中配置了缓存地址如下：
>
> ```nix
> nixConfig = {
>   extra-substituters = [
>     "https://cook-nixvim.cachix.org"
>   ];
>   extra-trusted-public-keys = [
>     "cook-nixvim.cachix.org-1:LjCZ3VSYrcwTQxHpd834EIswdkfHoSd/EsKUYLRruF4="
>   ];
> };
> ```
>
> !!! 如果你是**自定义安装**，**请务必删掉该段代码或更换为你自己的缓存地址**
> 如果你使用该配置，则无需修改，保持该配置，无需本地构建会从缓存地址下载构建好的缓存减少安装耗时，大幅提升安装体验。

**独立安装**

> [!TIP]
> 建议使用**快速体验**体验该配置，在决定使用什么方式安装  
> 自定义安装的文件修改的**注意事项见下方**

|    安装方式    |          说明          | 命令                                             |
| :------------: | :--------------------: | :----------------------------------------------- |
|  **快速体验**  | 临时运行，不安装到系统 | `nix run github:Youthdreamer/CookNixvim`         |
|  **永久安装**  |   安装到 Nix profile   | `nix profile add github:Youthdreamer/CookNixvim` |
| **自定义安装** | 需要先 Fork 并修改配置 | `nix profile add github:[用户名]/[仓库名]`       |

> [!NOTE]
> 非 Nixos 用户，需要安装 [**`Nix Manager`**](https://nixos.org/download/) 并开启 `flakes` 与 `nix-command` 功能  
> 功能开启方式推荐在 `~/.config/nix/nix.conf` 中写入 `experimental-features = nix-command flakes` 并重启终端

**使用Flake安装**

> [!TIP]
> 推荐使用 `Nixos` 的用户可以使用该方式，集成度更高

在 `flake.nix` 非常方便的导入

```nix
{
  inputs = {
    CookNixvim.url = "github:Youthdreamer/CookNixvim";
  }
}
```

安装到系统中，可以在 `inputs` 中引入，或者为其名

```nix
{ inputs, system, ...}:
{
  # NixOS
  environment.systemPackages = [ inputs.CookNixvim.packages.${pkgs.system}.default ];
  # home-manager
  home.packages = [ inputs.CookNixvim.packages.${pkgs.system}.default ];
}
```

之后就可以输入 **`nvim`** 命令使用编辑器

## 目录结构

### core/

核心全局通用设置

<details>
   <summary><strong>通用配置详情</strong></summary>

- **[autocmd](./config/core/autocmd.nix)**
  - 功能性自动命令
  - 包含自定义懒加载事件 `User CookLazy` 与 `User LazyFile` 等
- **[basic](./config/core/basic.nix)**
  - neovim 全局基础设置
  - 包含相对行号、搜索设置等
- **[keymap](./config/core/keymap.nix)**
  - 通用快捷键设置
  - 包含行移动、全选、窗口大小调整等常用快捷键等
  </details>

### neovide/

Neovide 专用配置

> 未安装 [neovide](https://neovide.dev/) 不影响使用

<details>
   <summary><strong>Neovide配置详情</strong></summary>

- **[basic](./config/neovide/basic.nix)**
  - Neovide 全局配置
  - 光标动画等
- **[keymap](./config/neovide/keymap.nix)**
  - Neovide 快捷键
  - UI缩放快捷键等

</details>

### plugins/

按功能划分的插件模块

> [!NOTE]
> **[`obsess`](https://github.com/Youthdreamer/obsess)** 插件被作为安装 `github` 中未被 [**`nixvim`**](https://nix-community.github.io/nixvim) 支持的插件的代码范例，默认保持开启  
> `lint` 插件仅仅为 `JS/TS` 配置，使用 `eslint_d`，插件默认保持关闭，因为 `lsp` 中启用了 `eslint`  
> AI 插件 `avante` 目前只配置了 `deepseek` 、千问等 API 配置，如果使用其他 API 提供商请自行修改配置

<details>
   <summary><strong>插件列表详情</strong></summary>

- ai
  AI 相关插件，用于代码辅助与对话式编辑 **(默认不开启)**
  - **[avante](./config/plugins/ai/avante.nix)**: 基于大模型的代码助手，支持对话、修改与生成代码
  - **[blink-cmp-avante](./config/plugins/ai/blink-cmp-avante.nix)**: 将 Avante 能力接入补全系统，提供 AI 辅助补全体验
- **[colorschemes/](./config/plugins/colorschemes/)**: 统一管理并切换多款第三方配色主题
- dap
  调试相关插件，提供统一的调试体验
  - **[nvim-dap](./config/plugins/dap/dap.nix)**: Neovim 的核心调试框架
  - **[nvim-dap-ui](./config/plugins/dap/dap-ui.nix)**: 为 nvim-dap 提供可视化调试界面
  - **[dap-lldb](./config/plugins/dap/languages/dap-lldb.nix)**: 基于 LLDB 的 C / C++ / Rust 调试配置
  - **[dap-go](./config/plugins/dap/languages/dap-go.nix)**: Go 语言调试支持
  - **[dap-js](./config/plugins/dap/languages/dap-js.nix)**: 通过 dap 简单配置的 js/ts 调试器配置
- **[dependencies](./config/plugins/dependencies/default.nix)**: 提供常用命令行工具的统一安装与管理
- editor
  编辑体验增强插件
  - **[aerial](./config/plugins/editor/aerial.nix)**: 提供代码结构大纲与符号导航
  - **[autotag](./config/plugins/editor/autotag.nix)**: 自动补全与更新成对标签
  - **[indent-blankline](./config/plugins/editor/indent-blankline.nix)**: 显示缩进参考线，提升代码层级可读性
  - **[mini-files](./config/plugins/editor/mini-files.nix)**: 轻量级文件管理器
  - **[mini-indentscope](./config/plugins/editor/mini-indentscope.nix)**: 高亮当前缩进作用域
  - **[neo-tree](./config/plugins/editor/neo-tree.nix)**: 功能完整的文件树浏览器
  - **[rainbow-delimiters](./config/plugins/editor/rainbow-delimiters.nix)**: 使用不同颜色高亮成对括号
  - **[todo-comments](./config/plugins/editor/todo-comments.nix)**: 高亮并管理代码中的 TODO / FIXME 注释
  - **[treesitter](./config/plugins/editor/treesitter.nix)**: 基于语法树的高亮与代码分析
  - **[ufo](./config/plugins/editor/ufo.nix)**: 提供更强大的代码折叠能力
- git
  Git 集成相关插件
  - **[gitsigns](./config/plugins/git/gitsigns.nix)**: 显示行级 Git 变更信息
  - **[lazygit](./config/plugins/git/lazygit.nix)**: 在 Neovim 中集成 lazygit 界面
- github
  GitHub 相关插件
  - **[obsess](./config/plugins/github/obsess.nix)**: 自定义计时任务插件，作为安装 github 插件的范例
- lsp
  语言服务器与代码质量插件
  - **[lsp](./config/plugins/lsp/lsp.nix)**: LSP 核心配置，提供补全与诊断能力
  - **[blink](./config/plugins/lsp/blink.nix)**: 补全体验增强插件
  - **[conform](./config/plugins/lsp/conform.nix)**: 统一的代码格式化工具管理
  - **[fidget](./config/plugins/lsp/fidget.nix)**: 显示 LSP 状态与进度提示
  - **[lint](./config/plugins/lsp/lint.nix)**: 代码静态检查功能（默认关闭）
- snippets
  代码片段管理
  - **[friendly-snippets](./config/plugins/snippets/friendly-snippets.nix)**: 提供丰富的通用代码片段集合
- ui
  界面与视觉增强插件
  - **[bufferline](./config/plugins/ui/bufferline.nix)**: 显示并管理打开的缓冲区
  - **[colorizer](./config/plugins/ui/colorizer.nix)**: 实时高亮颜色值
  - **[dashborad](./config/plugins/ui/dashboard.nix)**: 自定义 Neovim 启动界面
  - **[dressing](./config/plugins/ui/dressing.nix)**: 优化输入框与选择菜单 UI
  - **[lualine](./config/plugins/ui/lualine.nix)**: 轻量且高度可定制的状态栏
  - **[noice](./config/plugins/ui/noice.nix)**: 重构消息、命令行与通知 UI
  - **[transparent](./config/plugins/ui/transparent.nix)**: 提供透明背景支持
- utils
  通用效率工具插件
  - **[flash](./config/plugins/utils/flash.nix)**: 快速跳转到任意位置
  - **[harpoon](./config/plugins/utils/harpoon.nix)**: 快速标记并切换常用文件
  - **[img-clip](./config/plugins/utils/img-clip.nix)**: 将图片粘贴为本地文件或链接
  - **[markdown-preview](./config/plugins/utils/markdown-preview.nix)**: 实时预览 Markdown 文件
  - **[persistence](./config/plugins/utils/persistence.nix)**: 自动保存并恢复会话状态
  - **[project](./config/plugins/utils/project.nix)**: 项目管理与快速切换
  - **[render-markdown](./config/plugins/utils/render-markdown.nix)**: 在 Neovim 中渲染 Markdown 样式
  - **[surround](./config/plugins/utils/surround.nix)**: 快速添加、修改或删除包围符号
  - **[telescope](./config/plugins/utils/telescope.nix)**: 强大的模糊搜索与选择框架
  - **[toggleterm](./config/plugins/utils/toggleterm.nix)**: 内嵌终端管理
  - **[trouble](./config/plugins/utils/trouble.nix)**: 统一展示诊断、引用与错误列表
  - **[typst-preview](./config/plugins/utils/typst-preview.nix)**: 实时预览 Typst 文件
  - **[which-key](./config/plugins/utils/which-key.nix)**: 提示并引导快捷键使用

</details>

## 部分快捷键说明

> **快捷键说明，`<leader>` 默认为`空格键`**

|  高频快捷键  | 功能                 |
| :----------: | -------------------- |
| `<leader>e`  | 打开Neotree(文件树)  |
| `<leader>-`  | 文件编辑(mini-files) |
| `<leader>T`  | 编辑器主题切换       |
| `<leader>H`  | 帮助文档查询         |
| `<leader>gg` | 打开 `Lazygit`       |
| `<leader>qq` | 退出编辑器           |

<details>
     <summary><strong>常用快捷键</strong></summary>

| 文件查找快捷键(`<leader>f`) | 功能       |
| :-------------------------: | ---------- |
|             `b`             | 查找缓冲区 |
|             `f`             | 查找文件   |
|             `g`             | 全局搜索   |
|             `k`             | 快捷键搜索 |
|             `o`             | 历史文件   |
|             `p`             | 切换项目   |
|             `r`             | 高级搜索   |
|             `s`             | 字符快搜   |
|             `t`             | TODO查询   |

| 缓冲区快捷键(`<leader>b`) | 功能               |
| :-----------------------: | ------------------ |
|            `b`            | 快速切换缓冲区     |
|            `d`            | 删除缓冲区         |
|            `f`            | 查询并跳转缓冲区   |
|            `o`            | 删除其他缓冲区     |
|            `p`            | 切换缓冲区固定状态 |
|            `P`            | 删除未固定的缓冲区 |

| Lsp操作快捷键(`<leader>c`) | 功能              |
| :------------------------: | ----------------- |
|            `a`             | 代码操作          |
|            `d`             | 当前行诊断信息    |
|            `e`             | 当前文件诊断      |
|            `f`             | 文件大纲          |
|            `i`             | 查找实现          |
|            `l`             | 引用面板(Trouble) |
|            `r`             | 查找引用          |
|            `R`             | 重命名符号        |
|            `s`             | 切换符号面板      |
|            `[`             | 被调列表          |
|            `]`             | 调用列表          |

</details>

> **快捷键在编辑器内以 `which-key` 的方式展示，也可通过 `<leader>fk` 的方式查询快捷键**

## LSP 说明

默认安装 rust, c/cpp, python, lua, nix, go, ts/js, typst 等，详情可到 [`lsp.nix`](./config/plugins/lsp/lsp.nix) 文件下查看

## 主题切换说明

首次启动时默认主题为 `colorscheme default` 使用快捷键 `<leader>T` 可切换多种第三方主题。  
为实现主题切换功能，请将安装好的第三方主题的切换命令，如`gruvbox` 主题的切换命令为 `colorscheme gruvbox` 则在 [`theme-list.lua`](./config/plugins/colorschemes/theme-list.lua) 文件中写入该切换名称并设定 `dark` 或者 `light` 的模式。示例：`["gruvbox"] = { style = "dark" }`

## 复制粘贴功能说明

> **TL;DR：可以在 SSH 链接的终端中复制编辑器内容到系统，但不能直接 `p` 粘贴系统内容**

鉴于该配置可能**运行在远程 SSH 会话中**，为保证**跨系统复制粘贴**的可用性，引入了基于 **[OSC52](https://neovim.io/doc/user/provider.html#clipboard-osc52)** 的剪贴板传输方案。**采用 OSC52 的粘贴功能可能会导致编辑器卡住数十秒**，所以**禁用该粘贴功能**，也就是你无法使用 `p` 粘贴从系统中复制的内容，但是可以将编辑器中的内容复制到系统剪切板中，使用**系统自身**的粘贴快捷键将从系统复制的内容粘贴到编辑器中。该配置位置位于 [`config/core/basic.nix`](./config/core/basic.nix) 可根据自身需求调整。

## 从Github安装插件

> 由于 `neovim` 的插件众多并大部分托管于 `Github` 中，所以 `nixvim` 并不支持全部的插件安装选项。所以本章节介绍如何安装不支持的 `Github` 托管的插件

在本配置中的 [`github`](./config/plugins/github/) 文件夹下就是安装从 `Github` 上的插件。其中 [`obsess.nix`](./config/plugins/github/obsess.nix) 文件就是范例。所以请根据本文件中的例子模仿安装你想安装的插件。

```nix
   (pkgs.vimUtils.buildVimPlugin {
     name = "obsess";
     src = pkgs.fetchFromGitHub {
       owner = "Youthdreamer";
       repo = "obsess";
       rev = "22142f988073292ce51c4568fbda0a40970b876d";
       hash = "sha256-mWNZutb1Jzmp4CBCLAYaw3YJDv8tZJBcrBWq5TRgiMY=";
     };
   })
```

这段代码是最为核心的安装插件的代码，做简单说明。

- name: 一般为插件的名称
- owner: 插件仓库的拥有者
- repo: 插件仓库的名称
- rev: 插件在 `github` 上提交的的 `hash` 数值，该数值可决定你是用什么任何状态下的插件
- hash: 一般是系统生成，所以建议先不写这个选项，直接构建项目，会在报错信息中给出该选项的 `hash` 数值

之后在通过 `extraConfigLua` 该参数对插件配置，具体可参考 [`obsess.nix`](./config/plugins/github/obsess.nix) 文件中的代码范例(**该范例中也展示了如何使用 `lz.n` 对插件懒加载**)

> [`obsess`](https://github.com/Youthdreamer/obsess) 点击可达项目地址，本插件是专为本人编写的插件。在此配置中作为示例安装，默认开启。

## 懒加载说明

> 加载工具使用的 [`lz.n`](https://github.com/lumen-oss/lz.n)
> 懒加载所使用的自定义事件在 [autocmd.nix](./config/core/autocmd.nix)

> [!TIP]
> 本配置中额外设定了两个自定义用户事件作为懒加载的触发时机  
> 事件一: `User CookLazy` 在 `VimEnter` 之后触发。即当 `Neovim 已经启动完成 `时触发。  
> 事件二: `User LazyFile` 在 `BufReadPost` 与 `BUfNewFile` 后触发，即当 `真正有文件被打开或创建` 时触发。

使用自定义事件是为了，达到**更合理的插件加载时机与更快的启动速度**，但是**受制于一些插件的缘故无法使用懒加载，所以本项目尽量将启动速度拉到最快的同时不影响插件对于工作流的影响**，当然你可以对本项目的懒加载时机做个性化调整。

本配置中大量使用了自定义事件作为懒加载时机，你可以在打开本配置的编辑器后，使用`<leader>fg` 中输入 `User CookLazy` 与 `User LazyFile` 查看使用该事件的插件配置。

> 进一步的速度提升可以查看接下来的，[启动速度说明章节](#启动速度说明)

## 启动速度说明

- 禁用 [dashborad.nix](./config/plugins/ui/dashboard.nix) 该插件，可大幅提升首页加载速度(不影响打开文件速度)。
- 禁用 [transparent.nix](./config/plugins/ui/transparent.nix) 该插件，也可提高首页加载速度。
- 使用不同第三方插件的颜色主题也会影响启动速度，其中个人推荐使用 `gruvbox` 对启动速度的影响较小。

> 如不需要该插件，请 `fork` 仓库后将其注释或移除，以获得更快的加载体验。

## 文件内说明

在本配置中，在许多文件中都使用 `NOTE` 的标志说明了一些配置的细节与关键。
建议在配置中阅读相关的说明。如果你是用本配置的编辑器，那么推荐你使用快捷键 `<leader>ft` 查询。

> [!NOTE]
> ！！！重点推荐查看的 `NOTE` 在 [`obsess.nix`](./config/plugins/github/obsess.nix) 下，明确说明如何安装 `Nixvim` 官方不支持的 `Github` 上的 `Neovim` 插件，可对照该文件代码编写。
> `obsess.nix` 文件安装的 `obsess` 插件为我个人开发的 `neovim` 插件，个人使用，并非适合大多数人。

> [!WARNING]
> ai 插件默认关闭，打开请看文件内说明，同时应该在 `blink` 插件配置中打开对应的 ai 辅助插件的配置代码。

## Github Actions 说明

本项目的 `Actions` 是构建项目缓存并推向 [Cachix](https://app.cachix.org/) 方便使用该配置的用户避免本地构建浪费资源，优化体验。
但是如果你 `Fork` 本项目，那么默认是不开启此 Actions 任务的，你可以手动触发但是请注意将 actions 的配置文件中的内容改成你自己的 cachix 的内容，比如：设定 cachix 的认证令牌等机密变量与修改 `.github/workflows/cook-nixvim.yml` 文件的相关代码。

> [!TIP]
> 目前仅构建 `x86_64-linux` 与 `aarch64-linux` 两种架构缓存，另外的 `macos` 架构缓存默认关闭。
> `macos` 用户请查看[兼容性说明](#兼容性说明)

## 兼容性说明

> [!WARNING]
> **⚠️ 未在 `MacOS` 中测试**
> 可能无法在 `MacOS` 中正常使用，在 `ArchLinux` 与 `Nixos` 等表现稳定。

## 适用人群

- 追求在 Nixos 中使用 Nix 配置 Neovim 的用户
- 追求稳定复现配置的用户
- 追求一键安装，不想为各种插件依赖烦恼的用户

> [!WARNING]
> **⚠️ 但是本配置无法类似于 `lua` 配置的 `Neovim` 一样改动就可以及时查看效果，本配置必须构建后才可以生效修改后的配置，所以经常改动配置与经常安装不同插件的用户慎用**

## 友情提示

本配置是可以看到最终的 `lua` 配置的代码内容，在安装好本配置后使用 `nixvim-print-init` 即可看到最终的 `lua` 格式的配置文件。方便迁移。

> `nixvim-print-init` 是安装配置后自动生成的，每次更新配置后，查看新的 `lua` 配置都需要运行一次。  
> `nixvim-print-init | cat > my_init.lua` 即可输出到文件中查看。
