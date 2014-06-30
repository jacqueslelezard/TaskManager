config =

  dist: 'dist/'
  src: 'src/'

  distPublic: 'dist/public/'
  srcPublic: 'src/public/'

  compass:
    sass: "src/public/sass/"
    sassImg: "src/public/img/"
    css:  "dist/public/css/"

  nodemon:
    ignore: [
      "dist/public/"
    ]
    server: "dist/app.js"

  livereload: ['dist/public/**']

  components: 'components/'

  modules: ['app']

  publicjs: [

    "dist/public/app/main.js"
    "dist/public/app/**/*.js"
  ]



module.exports = config

