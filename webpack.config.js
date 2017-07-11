const webpack = require('webpack');
const path = require('path');

module.exports = {
  entry: "./src/app.tag",
  devtool: 'cheap-module-eval-source-map',
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
};
