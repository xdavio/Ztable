require(xtable)
#outer vectors
left <- seq(-2,2,by=.1)
up <- seq(0.00,.09,by=.01)

join <- function(x,y) {
    #x left
    #y up
    #t value for pnorm
    t <- ifelse(x < 0, x - y, x + y)
    pnorm(t)
}

Z <- round(outer(left,up,join),4)
rownames(Z) <- as.character(round(left,1))
colnames(Z) <- as.character(round(up,2))

sink("table.tex")
print(xtable(Z,digits=4))
