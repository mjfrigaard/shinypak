branches <- data.frame(
  name = c("main",
    "origin/02_movies-app",
    "origin/03_proj-app",
    "origin/04_description",
    "origin/05_rproj",
    "origin/06a_create-package"),
  updated = structure(c(1698246768,
                        1700321847,
                        1700261417,
                        1698957302,
                        1698957317,
                        1698957334),
    class = c("POSIXct", "POSIXt"),
    tzone = ""
  )
)
tidyr::separate_wider_delim(
  data = branches,
  cols = name,
  delim = "/",
  names = c("source", "branch_name"),
  cols_remove = FALSE,
  too_few = "align_end")

tidyr::separate(
  data = branches,
  col = name,
  into = c("source", "branch_name"),
  sep = "/",
  fill = "left"
)

sep_cols(
  data = branches,
  col = "name",
  into = c("source", "branch_name"),
  sep = "/")






# Apply the function


