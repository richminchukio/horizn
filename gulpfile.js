// Gulp
var gulp      = require('gulp');
var sass      = require('gulp-sass'); // Sass/CSS stuff
var prefix    = require('gulp-autoprefixer'); // Sass/CSS stuff
var minifycss = require('gulp-minify-css'); // Sass/CSS stuff
var size      = require('gulp-size'); // Stats and Things

// compile all your Sass
gulp.task('sass', function (){
	gulp.src(['./_horizn.scss'])
		.pipe(sass({ 
			includePaths: ['./'], 
			outputStyle: 'expanded' 
		}))
		.pipe(gulp.dest('./css'));
});

// Stats and Things
gulp.task('stats', function () {
	gulp.src('./**/*')
		.pipe(size())
		.pipe(gulp.dest('.'));
});

// A watcher that runs tasks when any specified files are changed
gulp.task('watch', function() {
  	gulp.watch('./**/*.scss', ['sass','stats']);
});

// The default task (called when you run `gulp` from cli)
gulp.task('default', ['sass','stats']);