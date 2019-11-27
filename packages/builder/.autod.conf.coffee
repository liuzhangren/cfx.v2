export default
  write: true
  registry: 'https://registry.npm.taobao.org'
  prefix: '~'
  devprefix: '^'
  plugin: ''
  test: []
  dep: [
    'cfx.require-plugin-coffee'
    'ddeyes'

    'deepmerge'
    'fs-extra'
    'is-plain-object'
    'klaw-sync'
  ]
  devdep: [
    'autod'
    'coffeescript'
    'shelljs'
  ]
  keep: [
    'cfx.styl'
  ]
  exclude: [
    './node_modules'
    './.autod.conf.js'
  ]
