#Chapter 2 : Overview of R
# uses of R
2+2
sqrt(10)
# Calc Interest
1000*(1+0.075)^5 - 1000 
pi
2*pi*6378
# degrees to radian
sin(c(20,60,90) * pi/180)

# numerical summaries
hills
load("hills.RData")
hills = hills
save.image("hills.RData")
summary(hills)
# graphics
pairs(hills)
# Analysis
cor(hills)
cor(log(hills))
str(elasticband)

# Linear Model
plot(distance ~ stretch, data=elasticband,pch=16)
elastic.lm =lm(distance ~ stretch, data=elasticband)
elastic.lm
summary(elastic.lm)

# Interactive Language
celsius = 25:30
fahrenheit = 1/5 * celsius + 32
fahrenheit
celsius
conversion = data.frame(Celsius = celsius, Fahrenheit = fahrenheit)
conversion
# save contents of workspace into file .RData

save.image()
save.image(file="archive.RData")
save(conversion, file="tempscales.RData")
save(celsius,fahrenheit,file="tempscales1.RData")

# checking images
attach("tempscales1.RData")
# position of search list
ls(pos=2)

# Default workspace  .RData

# Looping
for (i in 1:10) print(i)
for(celsius in 25:30) print(c(celsius, 9/5 * celsius + 32))

answer = 0
for (j in c(31,51,91)) { answer = j + answer ; print(answer) }
answer
# another way
sum(c(31,51,91))
rep(1:6)
x=0
while(x< 5) { x = x + 1 ; print(x)}

# Graph & Loop
plot.new()
oldpar <- par(mfrow = c(2, 4))
for (i in 2:9) {
  plot(austpop[, 1], log(austpop[, i]), xlab = "Year", ylab = names(austpop)[i],
  pch = 16+i, ylim = c(0, 10))
  }
         

# Vectors
3:10
c(3,4,5,6)
c(T,F,T,T)
c("Delhi","Mumbai","Kolkatta")

# Joining Vectors
x = c(2,3,4,5,6,7)
x
y = c(11,12,13)
z = c(x,y)
z

# Subset of Vector
#3rd and 4th element / rows
z[c(3,4)]
# Omitting the numbers
z[-c(3,4)]
# as per condition 
z>5
z[z> 5]


# Extract Elements
c(Dhiraj=12, Gagan=13, Udit=14) [c("Dhiraj","Udit")]
c(Dhiraj=12, Gagan=13, Udit=14) [c("Dhiraj")]

# use of NA in Vector Subscripts
y = c(1,NA,3,0,NA)
y
class(y)
is.na(y)
# replace NA values with another value
y[is.na(y)] = 0
y

# Factors
# Factor stored internally as numeric vector with values 1,2,..k k - no of levels
gender= c(rep('female',691),rep('male',692))
gender
# change gender from character to factor
str(gender)
class(gender)
gender = factor(gender)
# space is reduced for storage
str(gender)
class(gender)
table(gender)
levels(gender)
# assumed female is before male alphabetically
# Relevel
gender = relevel(gender, ref='male')
levels(gender)
# another way . available at the time of creation or later
gender = factor(gender,levels=c('male','female'))
levels(gender)
table(gender)
# Entering incorrect level names will cause error
gender = factor(gender,levels=c('Male','Female'))
levels(gender)
table(gender)  # Missing values 
# inspect object
attributes(gender)

# remove object 
rm(gender)
ls

# Data Frames - generalisation of Matrix
library(DAAG)
Cars93.summary

# row labels
row.names(Cars93.summary)
# Coln Labels / Attribute
names(Cars93.summary)

# Printing 4th Column
Cars93.summary$abbrev
Cars93.summary[,4]
Cars93.summary[,"abbrev"]
Cars93.summary[[4]]   #  4th list element

# Built in dataset
trees
summary(trees)

# Other useful Functions
print(trees)
cat(celsius,fahrenheit)
length(trees)
mean(trees$Volume)
median(trees[,2])
range(trees[[1]])
unique(trees["Volume"])
sort(trees$Girth)
order(trees$Girth)
cumsum(trees$Volume)
cumprod(trees$Volume)
rev(trees$Girth)

x1 = c(1,20,2,NA,22)
order(x1)
x1[order(x1)]
sort(x1) # omit NAs

# applying function to all columns of a data frame
rainforest
rf = rainforest
str(rf)
sapply(rf, is.factor)
# applies to species as this is only character
sapply(rf[,-7],range)
# some colns had NA values hence not calculated, range of each col as subscript
# some functions take NA values
# http://forums.psy.ed.ac.uk/R/P01582/essential-10/

rf
is.na(rf)
range(rf$branch,na.rm = T)  # omit NAs
str(rf)
range(rf$wood,na.rm = T)  # omit NAs
# apply range to all colns, ignore 7th col as it is factor, use na.rm=T to ignore NA value
sapply(rf[,-7],range,na.rm=T)
sapply(rf[,-7],mean,na.rm=T)
# count missing Values in each coln
sum(is.na(rf$branch))
sum(x==99, na.rm=T) # Count the occurrence of 99 in x, (omitting any NA)
# count missing Values in each subgroup

table(rf$species, is.na(rf$branch))



# making Tables - table of count
library(lattice)
barley  # data set
str(barley)
table(barley$year, barley$site)
unique(barley$site)
unique(barley$year)

# sometimes NA is also required to be included as factor
x = c(1,5,NA,6)
x = factor(x)
str(x)  # assumes levels 1,5 & 6 Ignores NA
x
factor(x,exclude=NULL)  # another level of NA included
y = c(1,2,NA,4)
str(y)
y = factor(y,exclude=NULL)
str(y)

# Search List - the order of search
search()
library(MASS)
search()  # new library included

# use of attach
names(primates)
str(primates)
primates
Bodywt  # object not found
attach(primates)
Bodywt  # now directly call coln names
search()  # see the search order
detach(primates)
# use with to attach temporarily
with(primates,mean(primates$Bodywt))
search()

# Functions in R
miles.to.km = function(miles) miles * 8/5
miles.to.km(175)
# several values
miles.to.km(c(100,200,300))

# Plotting Function
attach(florida)
florida
