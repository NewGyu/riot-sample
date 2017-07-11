process.env.NODE_ENV = process.env.NODE_ENV || "DEV";

const webpack = require('webpack');
const path = require('path');
const fs = require("fs");
const config = require("config");

// WebpackでまとめたJSからConfigを読み込む方法
// See: https://github.com/lorenwest/node-config/wiki/Webpack-Usage
const configFilePath = path.resolve(__dirname, "dist/config.json");
fs.writeFileSync(configFilePath, JSON.stringify(config));

module.exports = {
  entry: "./src/index.js",
  output: {
    path: path.resolve(__dirname, "dist"),
    filename: 'js/app.js'
  },
  module: {
    rules: [
      {
        test: /\.tag$/,
        use: 'riot-tag-loader',
        exclude: /node_modules/,
        enforce: "pre"
      },
      {
        test: /\.js$|\.tag$/,
        use: {
          loader: 'babel-loader',
          options: {
            presets: ['es2015-riot'],
            plugins: ["transform-regenerator", "transform-runtime"]
          }
        },
        exclude: /node_modules/,
      }
    ]
  },
  plugins: [
    // JSのMinify
    new webpack.optimize.UglifyJsPlugin({
      compress: {
        warnings: false
      }
    })
  ],
  resolve: {
    alias: {
      config: configFilePath
    }
  }
};
