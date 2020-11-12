# <https://github.com/harell/code/blob/master/src/allocation/domain/model.py>
tryCatchLog <- tryCatchLog::tryCatchLog
events <- new.env()
events$OutOfStock <- function(line.sku) print(line.sku)
line.sku <- "034595302"


# tryCatch ----------------------------------------------------------------
batch.reference <- tryCatch(
    {
        batchref <- 9090
        stop()
    },
    error = function(e){events$OutOfStock(line.sku); return(NULL)}
)
print(batch.reference)


# tryCatchLog -------------------------------------------------------------
batch.reference <- tryCatchLog(
    {
        batchref <- 9090
        stop()
    },
    error = function(e){events$OutOfStock(line.sku); return(NULL)}
)
print(batch.reference)
