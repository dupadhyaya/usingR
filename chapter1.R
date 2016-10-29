#Chapter 1 : Starting Up
austpop = read.table("austpop.txt",header=T)
austpop
plot(ACT ~ Year,data=austpop)
names(austpop)
plot(ACT ~ Year, data=austpop, pch=16)
# Entry of data at command line
elasticband = data.frame(stretch=c(46,54,48,50,44,42,52), distance=c(148,182,173,166,109,141,166))
elasticband
elasticband = edit(elasticband)
# check no of fields for each row/ line - do it if importing into table.
count.fields("austpop.txt")
# Help
help()
help(plot)
help.search("matrix")
apropos("matrix")
help.start()

# Save datasets
save.image("usingR.RData")
# Loading of DataSets
attach("usingR.RData")
load("usingR.RData")

# Exercises
ex1 = data.frame(year=1970:1969,snow.cover=c(6.5,12.0,14.9,10.0,7.9,21.0,12.5,14,6,9.2))
ex1
hist(ex1$snow.cover)

# orings
library(DAAG)
orings
str(orings)
plot(Total ~ Temperature, data=orings)
