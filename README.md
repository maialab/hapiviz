
<!-- README.md is generated from README.Rmd. Please edit that file -->

# hapiviz <img src='man/figures/logo.svg' align="right" height="139" />

<!-- badges: start -->
<!-- badges: end -->

This package provides functions for easy visualisation of data retrieved
with the REST API clients that comprise the hapiverse:
[gwasrapidd](https://github.com/ramiromagno/gwasrapidd) and
[quincunx](https://github.com/maialab/quincunx).

## Installation

``` r
# install.packages("remotes")
remotes::install_github("maialab/hapiviz")
```

## Example

Making a forest plot of performance metrics effect sizes:

``` r
library(quincunx)
library(hapiviz)

ppms <- get_performance_metrics(sprintf('PPM%06d', c(1:5, 14:18, 83, 85)))
forest_plot(ppms@pgs_effect_sizes)
```

<img src="man/figures/README-unnamed-chunk-2-1.png" width="100%" />
