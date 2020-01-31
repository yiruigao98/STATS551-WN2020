# suppose the posterior distribution is normal(1,2):
mysamples <- rnorm(10000, mean = 1, sd = 2)
hist(mysamples, freq = FALSE)

xseq <- seq(-4, 6, length.out = 200)
yseq <- dnorm(xseq, mean = 1, sd = 2)
lines(xseq, yseq, col = 'red')

# calculate the mean and standard deviation:
mean(mysamples)
sd(mysamples)

# calculate posterior interval:
posterior_interval <- quantile(mysamples, c(0.025, 0.975))
posterior_interval
abline(v = posterior_interval[1], col = "green")
abline(v = posterior_interval[2], col = "green")
abline(v = mean(mysamples), col = 'magenta')

# if I only know my posterior is proportional to exp(-theta^4):
xseq <- seq(-6, 6, length.out = 1000)
yseq <- exp(-xseq^4)
plot(xseq, yseq, type = 'l')

mysamples_v2 <- sample(xseq, 200000, replace = TRUE, prob = yseq)
hist(mysamples_v2, freq = FALSE, ylim = c(0,1), xlim = c(-6,6))
lines(xseq, yseq/(sum(yseq) * (xseq[2]-xseq[1])), col = 'red')

mean(mysamples_v2)
sd(mysamples_v2)

quantile(mysamples_v2, c(0.025, 0.975))



