// Future versions of Hyper may add additional config options,
// which will not automatically be merged into this file.
// See https://hyper.is#cfg for all currently supported options.

module.exports = {
  config: {
    updateChannel: 'stable',
    fontSize: 15,
    fontFamily: '"Knack Nerd Font", Menlo, "DejaVu Sans Mono", Consolas, "Lucida Console", monospace',
    cursorColor: 'rgba(248,28,229,0.8)',
    cursorShape: 'BLOCK', // `BEAM` for |, `UNDERLINE` for _, `BLOCK` for █
    cursorBlink: false,
    foregroundColor: '#fff',
    backgroundColor: "rgba(0,0,0,0.9)",
    vibrancy:"200",
    borderColor: '#000',
    // custom css to embed in the main window
    css: '',
    // custom css to embed in the terminal window
    termCSS: '',
    showHamburgerMenu: '',
    showWindowControls: 'left',
    padding: '12px 14px',
    colors: {
      black: '#000000',
      red: '#ff0000',
      green: '#33ff00',
      yellow: '#ffff00',
      blue: '#0066ff',
      magenta: '#cc00ff',
      cyan: '#00ffff',
      white: '#d0d0d0',
      lightBlack: '#808080',
      lightRed: '#ff0000',
      lightGreen: '#33ff00',
      lightYellow: '#ffff00',
      lightBlue: '#0066ff',
      lightMagenta: '#cc00ff',
      lightCyan: '#00ffff',
      lightWhite: '#ffffff'
    },
    shell: '',
    shellArgs: ['--login'],
    env: {},
    bell: 'SOUND', // set to false for no bell
    copyOnSelect: true
  },

  // a list of plugins to fetch and install from npm
  // format: [@org/]project[#version]
  // examples:
  //   `hyperpower`
  //   `@company/project`
  //   `project#1.0.1`
  hyperSpotify: {
      margin: 'double', // or 'double' or custom value
      controlsPosition: 'right', // or 'left' or 'right'
  },
  plugins: [
    'hyper-blink',
    // 'hyper-search',
    'gitrocket',
    // 'hyper-materialshell',
    // 'hyper-tabs-enhanced',
    'hyperfullscreen',
    'hypercwd',
    // 'hyperline',
    // 'hyper-statusline',
    // 'hyper-spotify',
    'hypertheme',
    // 'hyper-dark-scrollbar'
    //'hyperpower',
    // "hyperborder",
    // "hyper-tab-icons"
    // "hyper-pokemon",
  ],

  // in development, you can create a directory under
  // `~/.hyper_plugins/local/` and include it here
  // to load it and avoid it being `npm install`ed
  localPlugins: [],
  hyperTabs: {
    trafficButtons: true,
    tabIcons: true,
    tabIconsColored: true,
  },
  keymaps: {
    // Example
    // 'window:devtools': 'cmd+alt+o',
  }
};
