var gulp       = require("gulp"),
    imagemin   = require("gulp-imagemin"),
    sass       = require("gulp-sass"),
    sourcemaps = require("gulp-sourcemaps"),
    cleanCSS   = require("gulp-clean-css");

var config = {
    paths: {
        images: {
            src:  ["img/**/*.jpg", "img/**/*.jpeg", "img/**/*.png"],
            dest: "img"
        },
        sass: {
            src:   "sass/*.scss",
            dest:   "css",
            format: "scss",
            dir:    "sass"
        }
    }
};

gulp.task("images", function(){
    return gulp.src(config.paths.images.src)
        .pipe(imagemin({
            progressive: true,
            interlaced: true
        }))
        .pipe(gulp.dest(config.paths.images.dest));
});

gulp.task("sass", function() {
    return gulp.src(config.paths.sass.src)
        .pipe(sourcemaps.init({loadMaps: true}))
        .pipe(sass({outputStyle: "compressed"}))
        .pipe(cleanCSS())
        .pipe(sourcemaps.write("./"))
        .pipe(gulp.dest(config.paths.sass.dest));
});

gulp.task("watch", function(){
    gulp.watch(config.paths.sass.src, ["sass"]);
});

gulp.task("build", ["sass", "images"]);

gulp.task("default", ["sass"]);