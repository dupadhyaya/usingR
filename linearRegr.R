# Linear Regression http://use-r.com/download/linear_regression.R
# http://use-r.com/tag/r-statistics/
#Initialise
score <- c(1950,1900,1822,1700,1600)
age <- c(18,25,39,50,75)

# Display
score
score[1] < - 1955
score


#Simple plotting of the variables
par(mfrow = c(1, 1))
hist(score , main = "Histogram of Score")
boxplot(score)
cor(score,age)
plot(age,score)
abline(lsfit(age,score))

#Consolidating the variables into a data.frame
risk <- data.frame(score,age)
View(risk)
fix(risk)

#Understanding the type of variables
risk
class(risk)
class(score)
str(risk)
names(risk)

#Subsetting the data.frame

risk$score
risk$score > 1900
# Risk2 .... with Gender
subset(x = risk , score > 1800)
subset(x = risk2 , score > 1800 | sex == "M")
subset(x = risk2 , score > 1800 & sex == "M")
subset(x = risk2 , score > 1800 & sex == "M" , select = score:age )

# The regression

risk.fit <- lm(score ~ age)
risk.fit
summary(risk.fit)
# intersting graph
plot(risk.fit)


predict(risk.fit)
new.age <- data.frame(age = c(80,90))
new.age
predict(lm(score ~ age), new.age)
# 1        2
# 1550.762 1487.643

#add two new variables and do the same again
debt <- rnorm(n = 5 , mean = 50000 , sd = 20000)
sex <- c("M","F","M","M","F")

risk2 <- data.frame(score,age,debt,sex)

risk2.fit <- lm(risk2)
risk2.fit
summary(risk2.fit)
plot(risk2.fit)


subset(x = risk2 , score > 1800 | sex == "M")
subset(x = risk2 , score > 1800 & sex == "M")
subset(x = risk2 , score > 1800 & sex == "M" , select = score:age )

predict(risk2.fit)
new.age <- data.frame(age = c(80,90))
new.age
predict(risk2.fit, new.age)
