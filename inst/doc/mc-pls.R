## ----setup, include=FALSE-----------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>",
  message = FALSE,
  warning = FALSE
)

library(plssem)

## -----------------------------------------------------------------------------
set.seed(7208094)
n <- 10000
r <- 0.6
x <- rnorm(n)
y <- r * x + rnorm(n, sd = sqrt(1 - r^2))
cor(x, y)

## -----------------------------------------------------------------------------
z <- as.integer(x - mean(x) > 0)
w <- as.integer(y - mean(y) > 0)

## -----------------------------------------------------------------------------
cor(z, w)

## -----------------------------------------------------------------------------
g <- function(r_hat, R = 5000) {
  # Generate continuous data
  x <- rnorm(R)
  y <- r_hat * x + rnorm(R, sd = sqrt(1 - r_hat^2))

  # Generate binary data
  z <- as.integer(x - mean(x) > 0)
  w <- as.integer(y - mean(y) > 0)

  # Return a data.frame
  data.frame(z, w)
}

f <- function(df) {
  # Biased correlation between binary data
  cor(df$z, df$w)
}

## -----------------------------------------------------------------------------
print(f(g(0.0)))
print(f(g(0.3)))
print(f(g(0.5)))
print(f(g(0.6)))

## -----------------------------------------------------------------------------
r_biased_observed <- cor(z, w)
h <- function(r_hat) {
  f(g(r_hat)) - r_biased_observed
}

## -----------------------------------------------------------------------------
r_hat <- r_biased_observed # reasonable starting value
iter <- 20
history <- r_hat

for (i in seq_len(iter)) {
  temperature <- 1 / sqrt(i)
  epsilon <- h(r_hat)

  cat(sprintf("Iteration: %2d, r_hat: %.3f, epsilon: %6.3f\n", i, r_hat, epsilon))

  r_hat <- r_hat - temperature * epsilon
  history <- c(history, r_hat)
}

## ----echo=FALSE---------------------------------------------------------------
t <- seq_along(history)

fit <- stats::nls(
  history ~ c + a * exp(-k * t),
  start = list(
    c = mean(utils::tail(history, 3)),
    a = history[1] - mean(utils::tail(history, 3)),
    k = 0.1
  ),
  algorithm = "port",
  lower = c(c = -Inf, a = -Inf, k = 0)
)

fpredict <- function(t) {
  stats::predict(fit, newdata = data.frame(t = t))
}

df <- data.frame(t = t, r_hat = history)

ggplot2::ggplot(df, ggplot2::aes(x = t, y = r_hat)) +
  ggplot2::geom_hline(
    yintercept = r,
    linetype = 2,
    linewidth = 0.8,
    color = "grey40"
  ) +
  ggplot2::geom_function(
    fun = fpredict,
    linewidth = 1.2,
    color = "#0072B2"
  ) +
  ggplot2::geom_point(size = 2, color = "#D55E00") +
  ggplot2::labs(
    x = "Iteration",
    y = "r_hat",
    title = "Convergence (with exponential fit)"
  ) +
  ggplot2::theme_minimal()

## -----------------------------------------------------------------------------
set.seed(2346259)
pls('y ~ x', data = data.frame(x = z, y = w),
    ordered = c("y", "x"), mcpls = TRUE)

