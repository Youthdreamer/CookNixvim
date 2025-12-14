# CookNixvim

一个使用 Nix 构建的模块化 Neovim 配置。

## 目录结构

- core/  
  编辑器的基础配置（选项、快捷键、自动命令等）

- neovide/
  neovide的简单配置（光标动画，ui缩放快捷键）

- plugins/  
  按功能划分的插件模块（LSP、DAP、UI、AI 等）

## 使用方式

```bash
nix run github:Youthdreamer/CookNixvim

```
