## 1.(a)
rep(0:4, each=5) + 1:5 # 1 2 3 4 5 2 3 4 5 6 3 4 5 6 7 4 5 6 7 8 5 6 7 8 9

## 1.(b)
rep(1:5, 5) # 1 2 3 4 5 1 2 3 4 5 1 2 3 4 5 1 2 3 4 5 1 2 3 4 5

## 1.(c)
rep(0:4, each=5) # 0 0 0 0 0 1 1 1 1 1 2 2 2 2 2 3 3 3 3 3 4 4 4 4 4

## 1.(d)
more.colors <- c("red", "yellow", "blue", "green", "magenta", "cyan")
loc <- rep(0:3, each=3) + 1:3
color.vec <- more.colors[loc]
color.vec  # "red"     "yellow"  "blue"    "yellow"
           #"blue"    "green"   "blue"    "green"
           #"magenta" "green"   "magenta" "cyan"

## 1.(e)
length(unique(color.vec))  # 6

## 1.(f)
table(color.vec) # blue    cyan   green magenta     red  yellow 
                 #    3       1       3       2       1       2 

## 1.(g)
sort(color.vec, decreasing = T) # "yellow"  "yellow"  "red"     "magenta"
                                #"magenta" "green"   "green"   "green"
                                #"cyan"    "blue"    "blue"    "blue" 
#=====================================#

## 2.(a)
n <- seq(200,800,200) # c(200, 400, 600, 800)
a <- sum(seq(1,n[1])**2) # 2686700
b <- sum(seq(1,n[2])**2) # 21413400
c <- sum(seq(1,n[3])**2) # 72180100
d <- sum(seq(1,n[4])**2) # 170986800
Q2.a <- c(a, b, c, d)
Q2.a  # 2686700  21413400  72180100 170986800

## 2.(b)
Q2.b <- n*(n+1)*(2*n+1)/6
Q2.b  # 2686700  21413400  72180100 170986800

## 2.(c)
identical(Q2.a, Q2.b) # TRUE
#=====================================#

## 3.(a)
score0 <- c(81.2, 89.6, 64.2, 91.3, 77.4, 84.5, NA, 91.7, 63.5, 84.8, NA,
            87.8, 87.9, 80.9, 74.8, 64.3, 78.7, 91.3, 76.9, 74.9, 87.6, 88.4)
mean(score0)  # NA
max(score0)   # NA

## 3.(b)
mean(score0, na.rm = T) # 81.085
max(score0, na.rm = T)  # 91.7

## 3.(c)
score1 <- score0[!is.na(score0)]
mean(score1)  # 81.085
max(score1)   # 91.7
mean(score0, na.rm = T) == mean(score1) # TRUE
max(score0, na.rm = T) == max(score1)   # TRUE

## 3.(d)
score2 <- score0
score2[score2 %in% NA] <- c(67.2, 89.5)
score2  # 81.2 89.6 64.2 91.3 77.4 84.5 67.2 91.7 63.5 84.8 89.5
        # 87.8 87.9 80.9 74.8 64.3 78.7 91.3 76.9 74.9 87.6 88.4

## 3.(e)
mean(score2)  # 80.83636
max(score2)   # 91.7
