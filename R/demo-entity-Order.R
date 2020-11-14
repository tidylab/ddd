#' @title Order
#' @family Pizza Ordering
#' @noRd
Order <- R6::R6Class("Order", inherit = Entity, lock_objects = FALSE, cloneable = FALSE)

# Public Methods ----------------------------------------------------------
Order$set("public", "initialize", overwrite = TRUE, function(uid){
    super$initialize(uid)
    self$items <- R6DS::RDict$new()
    invisible(self)
})

Order$set("public", "review", function(uid){
    slips <- list()

    item_types <- self$items$keys
    for(item_type in item_types){
        item_dic <- do.call(self$items$get, args = list(key = item_type))
        for(item_key in item_dic$keys){
            item <- do.call(item_dic$get, args = list(key = item_key))
            slip <- tryCatch(
                tibble::add_column(item$review(), item = item_type, .before = 0),
                error = function(e) return(NULL))
            slips <- append(slips, list(slip))
        }
    }

    order_slip <- OrderSlip(uid = self$uid, slips = slips)
    return(order_slip)
})

Order$set("public", "get_pizza", function(uid){
    Pizza <- tryCatch(
        do.call(self$items$get("Pizza")$get, args = list(key = uid)),
        error = function(e) return(NULL)
    )
    return(Pizza)
})

Order$set("public", "get_item", function(uid, item_type){
    assert$is_character(uid)
    assert$is_character(item_type)

    item <- tryCatch(
        expr = {
            item_dic <- do.call(self$items$get, args = list(key = item_type))
            do.call(item_dic$get, args = list(key = uid))
        },
        error = function(e){
            return(NULL)
        }
    )

    return(item)
})

Order$set("public", "add_item", function(item){
    assert$is_entity(item)
    item_type <- class(item)[1]

    if(item_type %not_in% self$items$keys)
        do.call(self$items$add, args = list(key = item_type, val = R6DS::RDict$new()))

    item_dic <- do.call(self$items$get, args = list(key = item_type))
    self$remove_item(item)
    do.call(item_dic$add, args = list(key = item$uid, val = item))

    invisible(self)
})

Order$set("public", "remove_item", function(item){
    assert$is_entity(item)
    item_type <- class(item)[1]

    if(item_type %in% self$items$keys){
        item_dic <- do.call(self$items$get, args = list(key = item_type))
        do.call(item_dic$delete, args = list(key = item$uid))
    }

    invisible(self)
})
