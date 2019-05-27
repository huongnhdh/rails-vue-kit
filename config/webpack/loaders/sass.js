module.exports = {
  test: /\.scss$/,
  use: [
    {loader: 'css-loader'},
    {loader: "postcss-loader", options: { sourceMap: true }}
  ]
}