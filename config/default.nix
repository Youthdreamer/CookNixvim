{
  imports = [
    ./core
    ./plugins
    ./neovide
  ];

  enableMan = true;
  enablePrintInit = true;
  # Lua 字节码预编译（bytecode 编译）加速功能（默认不开启）
  # 让 Neovim 启动更快
  # 但是build时间变长，配置调试困难。推荐追求速度且不经常更改配置的同志们打开
  performance.byteCompileLua = {
    enable = true;
    configs = true;
    initLua = true;
    luaLib = true;
    nvimRuntime = true;
    plugins = true;
  };
}
