x <- 1:50
plot(x,sin(x))

# make plot look nicer
plot(x, sin(x), col="violetred", type="l", lwd=3)

# load in cdc dataset
source("http://thegrantlab.org/misc/cdc.R")

#check first and last rows
head(cdc$height)
tail(cdc$weight, n=20)

# creates plot of height vs weight
plot(cdc$height, cdc$weight, type="p", xlab="Height (inches)", 
     ylab="Weight(pounds)")
# check correlation of the height vs weight datapoints
cor(cdc$height, cdc$weight)
# generate histogram of the heights
hist(cdc$height)

height_m <- cdc$height * 0.0254
weight_kg <- cdc$weight * 0.454
bmi <- (weight_kg)/(height_m^2)
plot(cdc$height, bmi, xlab="Height (inches)", ylab="BMI (kg/m^2)")
cor(cdc$height, bmi)

head(bmi >= 30, 100)
eg <- c(TRUE, TRUE, FALSE, FALSE)
sum(eg)
sum(bmi >= 30)

sum(bmi >= 30)/length(bmi)
(sum(bmi >= 30)/length(bmi)) * 100
round( (sum(bmi >= 30)/length(bmi)) * 100, 1)

cdc[567,6]
cdc[1:10, 6]
cdc[1:10, ]

plot(cdc[1:100, "height"], cdc[1:100, "weight"], xlab="Height (inches)", 
     ylab="Weight (pounds)", main="Height vs Weight of first 100 respondents")

head(cdc, n=20)
# test approach using datasets...
add_bmi_df <- cdc
add_bmi_df$bmi <- bmi
obese_only_df <- add_bmi_df[add_bmi_df$bmi >= 30,]
nrow(obese_only_df[obese_only_df$gender=="m",])

# test Professor's tip
gender_vector <- cdc$gender
obese <- subset(gender_vector, bmi>=30)
table(obese)
