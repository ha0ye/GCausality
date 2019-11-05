library(rEDM)

init <- readRDS("init_values.RDS")
x_vals <- c(1, 2)
x_vals <- c(init$x, init$y)

x <- rep.int(x_vals, 100)
y <- numeric(200)
y[seq(1, 200, 2)] <- rnorm(100, 0)
y[seq(2, 200, 2)] <- rnorm(100, 1)

y_surr <- sample(y)

y_surr_p <- numeric(200)
idx <- seq(1, 200, 2)
y_surr_p[idx] <- y[sample(idx)]
idx <- seq(2, 200, 2)
y_surr_p[idx] <- y[sample(idx)]

dat <- data.frame(x = x, 
                  y = y, 
                  y_surr = y_surr, 
                  y_surr_p = y_surr_p)

block_lnlp(dat, tp = 0, columns = "y", target_column = "x")
block_lnlp(dat, tp = 0, columns = "y_surr", target_column = "x")
block_lnlp(dat, tp = 0, columns = "y_surr_p", target_column = "x")



