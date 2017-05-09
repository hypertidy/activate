
<!-- README.md is generated from README.Rmd. Please edit that file -->
[![Travis-CI Build Status](https://travis-ci.org/r-gris/activate.svg?branch=master)](https://travis-ci.org/r-gris/activate) [![AppVeyor Build Status](https://ci.appveyor.com/api/projects/status/github/r-gris/activate?branch=master&svg=true)](https://ci.appveyor.com/project/r-gris/activate) [![Coverage Status](https://img.shields.io/codecov/c/github/r-gris/activate/master.svg)](https://codecov.io/github/r-gris/activate?branch=master)

Overview
--------

Activation determines the context of subsequent manipulations, i.e. you have an object with multiple entities and you want the next functions that operate on that object to do their work in the context of one of those entities.

In real terms this might be list of multiple tables, *activation* brings one of those tables to the front. See `tidygraph` and `ncdump` for specific examples.

The `activate` package enables the addition of *activation* as a process to types in other packages.

Installation
------------

``` r
# NOT YET AVAILABLE Install from CRAN 
##install.packages("activate")

# Or the development version from GitHub
# install.packages("devtools")
devtools::install_github("r-gris/activate")
```

Usage
-----

`library(activate)` will load the package, but it will be normally used by other package developers whose users will be able to determine what is the `active` component, or `activate` a different component in a pipeline, or directly set the `active` status.

``` r
active(object)
#' [1] "sub-object01"

object %>% activate("sub-object05")

active(object) <- "sub-object03"
```

Use in other packages
---------------------

A simple context-controlling mechanism to 'activate' a named sub-entity in an object. The generic functions are provided with bare default methods and no checking. It is expected that other packages will import the generic and specialize it.

See the vignettes. TBD
