#' @title Dictionary Data Structure
#' @seealso \href{https://en.wikipedia.org/wiki/Associative_array}{What is a dictionary?}
#' @noRd
#' @export
Dictionary <- R6::R6Class("Dictionary", portable = FALSE, class = FALSE)

# Methods -----------------------------------------------------------------
Dictionary$set("private", ".elem", list())

Dictionary$set("active", "size", function(){ return(length(.elem)) })

Dictionary$set("public", "initialize", function(..., collapse=NULL){
    add_multiple(..., collapse=collapse)
})

Dictionary$set("active", "toList", function(){
    return(.elem)
})

Dictionary$set("public", "is_empty", function(){
    return(length(.elem) == 0)
})

Dictionary$set("public", "add", function(key, val = key){
    if(key != "") if(is.null(.elem[[key]])){ .elem[[key]] <<- val; return(TRUE) }
    return(FALSE)
})

Dictionary$set("public", "add_multiple", function(..., collapse=NULL){
    items = c(list(...), as.list(collapse))
    keys = if(is.null(names(items))) unlist(items) else names(items)

    if(!is.null(keys)){
        for(iter in seq_along(items)){
            if(keys[iter] == "") next
            if(is.null(.elem[[ keys[iter] ]])) .elem[[ keys[iter] ]] <<- items[[iter]]
        }
    }
})

Dictionary$set("public", "has", function(key){
    return(!is.null(.elem[[key]]))
})

Dictionary$set("public", "get", function(key){
    return(.elem[[key]])
})

Dictionary$set("public", "delete", function(key){
    if(is.null(.elem[[key]])) return(FALSE)
    .elem[[key]] <<- NULL
    return(TRUE)
})

Dictionary$set("active", "keys", function(){
    return(names(.elem))
})

Dictionary$set("active", "values", function(){
    return(unname(.elem))
})
