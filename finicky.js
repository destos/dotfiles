// Use https://finicky-kickstart.now.sh to generate basic configuration
// Learn more about configuration options: https://github.com/johnste/finicky/wiki/Configuration

module.exports = {
  defaultBrowser: "Firefox",
  handlers: [
    {
      match: /^https?:\/\/.*\.asana\.com\/.*$/,
      browser: "Google Chrome"
    },
    {
      match: /^https?:\/\/figma\.com\/.*$/,
      browser: "Google Chrome"
    },
    {
      match: /^https?:\/\/github\.com\/.*$/,
      browser: "Firefox"
    }
  ]
}
