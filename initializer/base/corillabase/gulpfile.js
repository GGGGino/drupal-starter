const { watch } = require('gulp');

function process(cb) {
  var gulp = require('gulp');
  var sass = require('gulp-sass');
  var postcss = require('gulp-postcss');
  var autoprefixer = require('autoprefixer');
  var cssnano = require('cssnano');

  var plugins = [
    autoprefixer(),
    cssnano()
  ];
  return gulp.src('./scss/*.scss')
            .pipe(sass().on('error', sass.logError))
            .pipe(postcss(plugins))
            .pipe(gulp.dest('./css'));
}

exports.default = function() {
  watch(['./scss/*.scss', './scss/*/*.scss'], process);
};