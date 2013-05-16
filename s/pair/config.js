seajs.config({
  plugins: ['shim'],

  // 配置别名
  alias: {
    'jquery': {
      src: 'lib/jquery-1.9.1.min.js',
      exports: 'jQuery'
    }
  }
});