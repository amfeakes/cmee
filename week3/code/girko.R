#!/usr/bin/env Rscript

#Author: Amy Feakes
#Script: girko.R
#Description: script to combine plotting girko's law simulation and saves the results 
#Date: Oct 2022

#Clear workspace
rm(list=ls())

#Dependencies
require(ggplot2)
#building a function to calculate the ellipse

build_ellipse <- function(hradius, vradius) { #function that returns an ellipse
  npoints=250
  a <- seq(0, 2 * pi, length = npoints + 1)
  x <- hradius * cos(a)
  y <- vradius * sin(a)
  return(data.frame(x=x, y=y))
  }

N <- 250 #assign the size of the matrix
M <- matrix(rnorm(N * N), N, N) #build the matrix
eigvals <- eigen(M)$values #find the eigenvalues
eigDF <- data.frame("Real" = Re(eigvals), "Imaginary" = Im(eigvals)) #Build a dataframe 
my_radius <- sqrt(N) #the radius of the circle is sqrt(N)
ellDF <- build_ellipse(my_radius, my_radius) #Data frame to plot the ellipse 
names(ellDF) <- c("Real", "Imaginary") #rename columns 

# plot the eigenvalues
p <- ggplot(eigDF, aes(x = Real, y = Imaginary))
p <- p +
  geom_point(shape = I(3)) +
  theme(legend.position = "none")
# now add the vertical and horizontal line
p <- p + geom_hline(aes(yintercept = 0))
p <- p + geom_vline(aes(xintercept = 0))
# finally, add the ellipse
p <- p + geom_polygon(data = ellDF, aes(x = Real, y = Imaginary, alpha = 1/20, fill = "red"))
p

#save as pdf 
pdf(paper = "a4r", width = 0, height = 0,"../results/Girko.pdf")
print(p)
dev.off()