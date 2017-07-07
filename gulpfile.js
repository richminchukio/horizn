// Gulp
var gulp      = require('gulp');
var sass      = require('gulp-sass'); // Sass/CSS stuff
var prefix    = require('gulp-autoprefixer'); // Sass/CSS stuff
var minifycss = require('gulp-minify-css'); // Sass/CSS stuff
var size      = require('gulp-size'); // Stats and Things

// compile all your Sass
gulp.task('sass', function (){
	gulp.src(['**/_horizn.scss', '!node_modules/**/*', '!**/_horizn-vars.scss'])
		.pipe(sass(
			{includePaths: ['dev/sass'], outputStyle: 'expanded' }
		))
		.pipe(prefix("last 1 version", "> 1%", "ie 8", "ie 7"))
		.pipe(gulp.dest('css'))
		.pipe(minifycss())
		.pipe(gulp.dest('css'));
});

// Stats and Things
gulp.task('stats', function () {
	gulp.src(['**/*', '!node_modules/**/*'])
		.pipe(size())
		.pipe(gulp.dest('.'));
});

// A watcher that runs tasks when any specified files are changed
gulp.task('watch', function() {
  	gulp.watch('**/*.scss', ['sass','stats']);
});

// The default task (called when you run `gulp` from cli)
gulp.task('default', ['sass','stats']);