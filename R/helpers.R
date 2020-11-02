# base --------------------------------------------------------------------
find.template <- function(...){
    path <- base::system.file(..., package = "ddd")
    if(nchar(path) == 0) path <- base::system.file("inst", ..., package = "ddd")
    if(nchar(path) == 0) stop("Couldn't find template")
    return(path)
}

# fs ----------------------------------------------------------------------
file.create <- function(path) {dir.create(dirname(path), F, T); fs::file_create(path)}
