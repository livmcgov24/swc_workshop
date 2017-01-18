#  Notes from Software Carpentry Worshop
#  January 17, 2017
#  Author: Olivia McGovern 

# Load necessary packages
library("ggplot2")

download.file("https://raw.githubusercontent.com/swcarpentry/r-novice-gapminder/gh-pages/_episodes_rmd/data/gapminder-FiveYearData.csv", destfile = "gapminder-FiveYearData.csv")

#  Read in Data file

gapminder <- read.csv("gapminder-FiveYearData.csv")
head(gapminder)

#  Like in BASH, if you run the head command, it will list the top
#  6 values for you by default. 

tail(gapminder, 10)

#  Like in BASH, if you run the tail command, it will list the bottom
#  6 values for you by default. Add ,n to indicate how many values 
#  you would like to see.

colnames(gapminder)

#  Gives the variable/column labels for your loaded data set.

str(gapminder)

#  Generates a data frame for the data set. 
#  Catergorical data entered as alphanumberical strings are 
#  classified as Factors
#  Also numerical or interger for numbers

nrow(gapminder)
ncol(gapminder)
dim(gapminder)
summary(gapminder)

#  Summary stats on the number of rows, columns, rows and columns, 
#  and a summary of each variable in terms of frequency for categorical
#  data and min, med, interquartile range for numbers/integers.
# When opening a data set for the first time, it is good to check
#  nrow, ncol, dim, summary, view, str, colnames, head to perform you data
#  hygeine check. Make sure your data is clean and ready for analysis.

gapminder [1, ]
gapminder [531, ]
gapminder [ ,3]

#  Filename [row number/value, column number/value]

gapminder [, c("country", "year", "pop")]

#  Creates a vector that will generate the country, year and populaiton 
# for all rows.

gapminder $pop
gapminder[,3]
gapminder[,"pop"]

#  All give you the populaiton values for all rows.

gapminder[1:5,]

#  Gives you the first 5 rows

gapminder[c(23, 554, 1000),]

#  Gives you the rows selected by this vector

is_long_lifeExp <- gapminder$lifeExp > 80
head (is_long_lifeExp)
gapminder [is_long_lifeExp, ]

#  

#  In 2007, what were the life expectancies for the countries in 
#  Africa?
#  Write out your pseudo-code of steps first!
#  African Countries' life expectancies for 2007
#  Step 1 --> 2007 data
#  Step 2 --> Africa data
#  Step 3 --> pull 2007 and Africa

colnames(gapminder)
is_2007 <- gapminder$year == 2007
is_Africa <- gapminder$continent == "Africa"
africa_2007 <- gapminder[is_2007 & is_Africa, c("country", "lifeExp")]
africa_2007

# And for 1952...

is_1952 <- gapminder$year == 1952
is_Africa <- gapminder$continent == "Africa"
africa_1952 <- gapminder[is_1952 & is_Africa, c("country", "lifeExp")]
africa_1952

#  To order your data by life expectancy, apply the order function 
# to the variable you are interested in...

o <- order (africa_2007$lifeExp)
africa_2007[o,]

#  Creating publication quality graphics - Base graphics versus ggplot2
#  ggplot = grammar of graphics
#  thinking about your graphics in terms of layers - data, 
#  aestetics (x and y axis, color, size and location of a point, 
#  line, shape, statistics)

library("ggplot2")
ggplot(data = gapminder, aes(x = gdpPercap, y = lifeExp)) +
  geom_point() +
  facetgrid()

#  Plot gapminder, aes = aesthetics ( x axis, y axis) + represent 
#  plotted data as points

library("ggplot2")
ggplot(data = gapminder, aes(x = year, y = lifeExp, color = continent)) +
  geom_point()

#  Plot life expectancy by year, colored by continent

library("ggplot2")
ggplot(data = gapminder, aes(x = year, y = lifeExp, by = country, color = continent)) +
  geom_line()

#  Lines for each country, colored by continent

library("ggplot2")
ggplot(data = gapminder, aes(x = year, y = lifeExp, by = country, color = continent)) +
  geom_line() + geom_point()

library("ggplot2")
ggplot(data = gapminder, aes(x = year, y = lifeExp, size=gdpPercap, by = country, color = continent)) +
  geom_line() + geom_point()

#  Size of the point and line is proportional to the gdpPercap

library("ggplot2")
ggplot(data = gapminder, aes(x = year, y = lifeExp, by = country, color = continent)) +
  geom_line() + geom_point(aes(size=gdpPercap))

#  Only the points have the aestetic that size is proportional to 
#  the gdpPercap

library("ggplot2")
ggplot(data = gapminder, aes(x = year, y = lifeExp, by = country, color = continent)) +
  geom_line(color="black") + geom_point(aes(size=gdpPercap))

#  Color all lines black

library("ggplot2")
ggplot(data = gapminder, aes(x = gdpPercap, y = lifeExp, color=continent)) +
  geom_point(aes(size=pop))

# Color by c ontinent and size by pop  size





library("ggplot2")
ggplot(data = gapminder, aes(x = gdpPercap, y = lifeExp, color=continent)) +
  geom_point() + facet_grid(.~continent)

#  save plot, creates file of last plot generated, specifying height
#  and width dimensions in the specified units

ggsave("year_vs_lifeexp_bycont.png", width = 5, height = 4, units = "in")


