{
  plugins.conform-nvim.enable = true;
  plugins.conform-nvim.lazyLoad = {
    settings = {
      cmd = ["ConformInfo"];
      event = ["BufWrite"];
    };
  };
  plugins.conform-nvim.autoInstall.enable = true;
  plugins.conform-nvim.settings = {
    notify_on_error = true;
    formatters_by_ft = {
      c = ["clang_format"];
      cpp = ["clang_format"];
      rust = ["rustfmt"];
      python = [
        # 修复可以被 Ruff 自动修复的 lint（代码规范）错误。
        "ruff_fix"
        # 运行 Ruff 的代码格式化功能。
        "ruff_format"
        # 整理 import（按规则排序、删除未使用的 import）。
        "ruff_organize_imports"
      ];
      nix = ["alejandra"];
      lua = ["stylua"];
      toml = ["taplo"];
      go = ["goimports"]; # 包含gofmt的功能，附带import的管理
      javascript = [
        "eslint_d"
        "prettierd"
      ];
      typescript = [
        "eslint_d"
        "prettierd"
      ];
      javascriptreact = [
        "eslint_d"
        "prettierd"
      ];
      typescriptreact = [
        "eslint_d"
        "prettierd"
      ];
      css = ["prettierd"];
      scss = ["prettierd"];
      html = ["prettierd"];
      yaml = ["prettierd"];
      markdown = ["prettierd"];
      json = ["jq"];
      bash = ["shfmt"];
    };

    format_on_save = {
      timeout_ms = 500; # 格式化超时时间（毫秒）
      lsp_fallback = true; # 如果没有可用的格式化器，使用 LSP 格式化
    };
  };
}
