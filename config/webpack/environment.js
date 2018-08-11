const { environment } = require("@rails/webpacker");
const webpack = require("webpack");

// resolve-url-loader must be used before sass-loader
environment.loaders.get("sass").use.splice(-1, 0, {
  loader: "resolve-url-loader",
  options: {
    attempts: 1
  }
});

environment.plugins.prepend(
  "Provide",
  new webpack.ProvidePlugin({
    $: "jquery",
    jQuery: "jquery",
    "window.jQuery": "jquery",
    Popper: ["popper.js", "default"],
    // In case you imported plugins individually, you must also require them here:
    Util: "exports-loader?Util!bootstrap/js/dist/util",
    Dropdown: "exports-loader?Dropdown!bootstrap/js/dist/dropdown"
  })
);

module.exports = environment;
