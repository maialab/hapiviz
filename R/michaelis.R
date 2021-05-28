michaelis <- function(x, k) {
  x / (x + k)
}

michaelis2 <- function(x, p) {
  maximum <- max(x)
  k <- p * maximum
  michaelis(x, k)
}
