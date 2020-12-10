cat(banner("Unit Tests"))

# Create dummy project folder structure
test_wd <- tempfile("test-")

# Import internal functions
filename <- ddd:::filename
title <- ddd:::title

DummyDomainService <- ddd:::DummyDomainService
DummyEntity <- ddd:::DummyEntity
DummyValueObject <- ddd:::DummyValueObject
