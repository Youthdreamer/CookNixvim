{
  plugins.project-nvim = {
    enable = true;
    lazyLoad = {
      enable = true;
      settings.event = "BufRead";
    };
    # enableTelescope = true;
    settings = {
      excludeDirs = [];
      detection_methods = [
        "pattern"
        "parent"
      ];
      patterns = [
        ".git"
        "Makefile"
        "package.json"
        "pyproject.toml"
        "Cargo.toml"
        ".project-root"
      ];
    };
  };
}
