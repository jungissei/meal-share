const { environment } = require('@rails/webpacker')

//jQuery & Bootstap's JavaScript
const webpack = require('webpack')
environment.plugins.prepend(
  'Provide',
  new webpack.ProvidePlugin({
    $: 'jquery',
    Popper: 'popper.js'
  })
)

module.exports = environment
