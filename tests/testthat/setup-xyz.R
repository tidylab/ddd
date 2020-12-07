cat(banner("Unit Tests"))
source("../dummies.R")

# Create dummy project folder structure
test_wd <- tempfile("test-")

# Import internal functions
filename <- ddd:::filename
title <- ddd:::title

