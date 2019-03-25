
#Test invertible matrix

#Make invertible matrix
m1 <- makeCacheMatrix(matrix(c(2, 1, 5, 3), nrow = 2, ncol = 2))

#Display matrix
m1

#Get values of the matrix
m1$get()

#Try to get the inverse matrix value. NULL must be returned.
m1$getInverseMatrix()

#Compute for first time the inverse matrix value.
cacheSolve(m1)

#Get matrix value
m1$get()

#Brings back the inverse matrix value.
m1$getInverseMatrix()

#Try to get the inverse matrix value again. Must get the value from the cache. Value
#is not computed again.
cacheSolve(m1)

#Get matrix value
m1$get()

#Get the inverse matrix value from the cache.
m1$getInverseMatrix()


#Check that the inverse matrix values are correctly calculated.
m1Identity <- m1$get() %*% m1$getInverseMatrix()

#Displays the calculated identity matrix.
m1Identity




