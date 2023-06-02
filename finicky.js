module.exports = {
  defaultBrowser: "Firefox",
  rewrite: [
    // {
    //   // Redirect all urls to use https
    //   match: ({ url }) => url.protocol === "http",
    //   url: { protocol: "https" }
    // }
  ],
  handlers: [
    {
      // Open apple.com and example.org urls in Safari
      match: ["apple.com/*",],
      browser: "Safari"
    },
    {
      // Open any url that includes the string "workplace" in Firefox
      match: /google.com/,
      browser: "Firefox"
    },
  ]
}
