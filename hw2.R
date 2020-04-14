# 1.
two.dice <- matrix( c(3, 5, 5, 4, 4, 3, 4, 5, 5, 2, 3, 2, 6, 6, 6,
                      3, 6, 2, 1, 2, 5, 6, 1, 5, 6, 1, 3, 6, 6, 3,
                      5, 3, 3, 5, 3, 3, 4, 2, 1, 4, 3, 1, 5, 1, 6,
                      4, 5, 5, 3, 5, 2, 2, 1, 2, 2, 6, 1, 3, 4, 5,
                      6, 4, 3, 3, 6, 1, 2, 1, 4, 5, 1, 1, 2, 3, 6,
                      5, 6, 5, 3, 1, 4, 1, 5, 2, 2, 6, 3, 2, 3, 1,
                      5, 1, 2, 5, 1, 1, 1, 3, 1, 3, 4, 1, 6, 5, 1,
                      5, 6, 6, 5, 5, 2, 4, 1, 3, 5, 2, 1, 1, 1, 1), ncol = 2)
S <- c()
i <- 1
while (length(unique(S)) < 11) {
  S <- c(S, sum(two.dice[i, ]))
  i <- i + 1
}
print(length(S))  # 43

# 2.
U <- c(0.89, 0.03, 0.52, 0.41, 0.09, 0.37, 0.71, 0.29, 0.01, 0.92,
       0.53, 0.14, 0.64, 0.94, 0.89, 0.19, 0.33, 0.31, 0.24, 0.15)
n <- 0
product <- 1
while (product > 1e-08) {
  n <- n + 1
  product <- product * U[n]
}
print(n - 1)  # 15

# 3.
Math <- c(79, 61, 76, 40, 51, 98, 48, 34, 54, 51, 45, 61, 75, 42, 32,
          61, 56, 82, 22, 33, 19, 60, 91, 49, 44)
English <- c(87, 54, 96, 63, 58, 75, 60, 74, 46, 94, 57, 69, 69, 55, 79,
             94, 72, 86, 85, 56, 62, 77, 78, 62, 56)
## (a)
scores <- matrix(c(Math, English), ncol = 2)
colnames(scores) <- c("Math", "English")
rownames(scores) <- 1 : nrow(scores)
scores

## (b)
Class = rep("D", nrow(scores))
Class[which(Math >= 60 & English >= 60)] = "A"
Class[which(Math >= 60 & English < 60)] = "B"
Class[which(Math < 60 & English >= 60)] = "C"
for (i in c("A", "B", "C", "D")) {
  cat("Number of event ", i, ": ", length(which(Class == i)), "\n", sep = "")
}


## (c)
for (i in c("A", "B", "C", "D")) {
  cat("Students' ID in category", paste(i, ":", sep = ""), which(Class == i), "\n")
}

# 4.
#v <- c(5, 10, 11, 1, 0, 3, 8, 10, 4, 0, 1, 6, 7, 10, 7, 0)
v <- c(7, 5, 0, 1, 2, 7, 1, 10, 5, 0, 3, 7, 2, 3, 3)
v <- v[-which(v == 0)]
# using cat()
cat("(1) Sum: ", sum(v), "\n",
    "(2) Length: ", length(v), "\n",
    "(3) Average: ", mean(v), "\n",
    "(4) # of odd: ", length(which(v %% 2 == 1)), "\n",
    "(5) # of 10: ", length(which(v == 10)), "\n",
    "(6) Max: ", max(v), "\n", sep = "")

# using paste()
writeLines(paste("(1) Sum: ", sum(v), "\n",
    "(2) Length: ", length(v), "\n",
    "(3) Average: ", mean(v), "\n",
    "(4) # of odd: ", length(which(v %% 2 == 1)), "\n",
    "(5) # of 10: ", length(which(v == 10)), "\n",
    "(6) Max: ", max(v), "\n", sep = ""))