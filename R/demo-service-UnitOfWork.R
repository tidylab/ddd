#' @title Unit of Work for Development and Tests
#' @description This implementation uses a dictionary structure
#' @noRd
FakeUnitOfWork <- R6::R6Class("FakeUnitOfWork", inherit = AbstractUnitOfWork, lock_objects = FALSE)

FakeUnitOfWork$set("public", "orders", R6DS::RDict$new())

FakeUnitOfWork$set("public", overwrite = TRUE, "enter", function(){
    self$.orders <-  self$orders$clone()
    super$enter()
})

FakeUnitOfWork$set("public", overwrite = TRUE, "exit", function(){
    super$exit()
})

FakeUnitOfWork$set("public", overwrite = TRUE, "commit", function(){
    self$.orders <-  self$orders
})

FakeUnitOfWork$set("public", overwrite = TRUE, "rollback", function(){
    self$orders <- self$.orders
})
