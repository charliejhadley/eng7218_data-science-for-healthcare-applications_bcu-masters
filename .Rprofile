# REMEMBER to restart R after you modify and save this file!

# First, execute the global .Rprofile if it exists. You may configure blogdown
# options there, too, so they apply to any blogdown projects. Feel free to
# ignore this part if it sounds too complicated to you.
if (file.exists("~/.Rprofile")) {
  base::sys.source("~/.Rprofile", envir = environment())
}

# Now set options to customize the behavior of blogdown for this project. Below
# are a few sample options; for more options, see
# https://bookdown.org/yihui/blogdown/global-options.html
options(
  # to automatically serve the site on RStudio startup, set this option to TRUE
  blogdown.serve_site.startup = FALSE,
  # to disable knitting Rmd files on save, set this option to FALSE
  blogdown.knit.on_save = TRUE,
  # build .Rmd to .html (via Pandoc); to build to Markdown, set this option to 'markdown'
  blogdown.method = 'html',
  # Default options for new post creation
  # This avoids writing new_post(author = "Bernhard Bieri", ...) and replaces it
  # with new_post(). Pretty neat!
  blogdown.author = "Bernhard Bieri",
  blogdown.ext = ".Rmarkdown",
  blogdown.subdir = "posts"
)

# fix Hugo version
options(blogdown.hugo.version = "0.89.4")

.website_colours <- list(website_dark_blue = "#2E516C", website_light_blue = "#34A2B0",
  website_off_white = "#FEFAD6", website_green = "#ADA454", website_red = "#CB324F"
)
