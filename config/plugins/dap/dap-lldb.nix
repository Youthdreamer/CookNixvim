{pkgs, ...}: {
  # plugins.dap-lldb = {
  #   enable = true;
  # };
  plugins.dap-go.enable = true;
  # plugins.dap-go.lazyLoad = {
  #   enable = true;
  #   settings = {
  #     after = ["nvim-dap"];
  #   };
  # };
  extraPackages = [
    pkgs.delve
  ];
}
