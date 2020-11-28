
# `ddd` <img src='https://i.imgur.com/M8Jk1AL.png' align="right" height="75"/>

<!-- badges: start -->

[![CRAN
status](https://www.r-pkg.org/badges/version/ddd)](https://CRAN.R-project.org/package=ddd)
[![test-suite](https://github.com/tidylab/ddd/workflows/test-suite/badge.svg)](https://github.com/tidylab/ddd/actions)
[![code-coverage](https://codecov.io/gh/tidylab/ddd/branch/master/graph/badge.svg)](https://codecov.io/github/tidylab/ddd/?branch=master)
<!-- badges: end -->

## `Domain-driven Design (ddd)`

<img src="https://i.imgur.com/RLEQkhe.png" width="100%" style="display: block; margin: auto;" />

## Overview

Put Domain-driven Design (DDD) to practice on analytic projects in R.
This package includes key DDD classes for instantiating Domain Events,
Commands, Entities, Value Objects, Domain Services and Aggregates.

<!-- Although each domain model is different, many patterns occur repeatedly. -->

## Installation

You can install `ddd` by using:

``` r
install.packages("remotes")
remotes::install_github("tidylab/ddd")
```

Optionally, you can make a project independent of the `ddd` package by
calling `use_ddd()`. `ddd` is needed for software development and has no
added value in production. `use_ddd()` will copy the necessary R classes
and functions into your project.
