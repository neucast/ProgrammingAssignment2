##This function makeCacheMatrix(), creates a special "matrix", which is really
##a LIST containing a functions to:
##1.- Set the value of the invertible matrix
##2.- Get the value of the invertible matrix
##3.- Set the inverse value of the given invertible matrix
##4.- Get the inverse value of the given invertible matrix
##Note: this function assumes that the supplied matrix IS ALWAYS INVERTIBLE.
makeCacheMatrix <- function(x = matrix()) {
    #Preserves state inside of an R object. Creates a type of "cache".

    #Initialize the inverse matrix value.
    inverseMatrix <- NULL

    #Inner function
    #1.- Receives "y" (invertible matrix) value and set it to the other context
    #"x" (invertible matrix) value
    #2.- Sets the other context inverse matrix value "inverseMatrix" to NULL
    #This function is used to preserve state inside of an R object. Creates the
    #"cache".
    set <- function(y) {
        x <<- y
        inverseMatrix <<- NULL

    }

    #Setters and getters of the value object (VO or DTO).

    #Inner function
    #Brings back "x" matrix.
    get <- function()
        x

    #Inner function
    #Sets other context "inverseMatrix" value, with the "calculatedInverseMatrix"
    #given value.
    setInverseMatrix <-
        function(calculatedInverseMatrix)
            inverseMatrix <<- calculatedInverseMatrix

    #Inner function
    #Brings back "inverseMatrix" (inverse value of the matrix) value.
    getInverseMatrix <- function()
        inverseMatrix

    #Lists the cached values.
    list(
        set = set,
        get = get,
        setInverseMatrix = setInverseMatrix,
        getInverseMatrix = getInverseMatrix
    )
}


##The following function calculates the inverse matrix value of the
##special "matrix" created by makeCacheMatrix() function.
##This function checks to see if the inverse matrix value has already been
##calculated. If so, it just gets the inverse matrix value from the cache
##and then, skips the computation. Otherwise, it calculates the
##inverse value of the matrix from the given data and sets the calculated value
##in the cache via the setInverseMatrix() function.
##Note: this function assumes that the supplied matrix IS ALWAYS INVERTIBLE.
cacheSolve <- function(x, ...) {
    ##Returns a matrix that is the inverse of 'x'.
    inverseMatrix <- x$getInverseMatrix()

    #Checks to see if the inverse matrix "inverseMatrix" has already
    #been calculated.
    if (!is.null(inverseMatrix)) {
        #Found that the inverse matrix has been calculated (and the matrix has
        #not been changed). The inverse matrix is different from NULL.
        message("Getting cached data...")
        #It gets the inverse matrix from the "cache" and then, skips the computation.
        return(inverseMatrix)
    }
    else {
        #Found the the inverse matrix is NULL and has not been calculated.

        #Gets the given data from the special matrix.
        data <- x$get()

        #Calculates the inverse matrix value from the extracted data.
        inverseMatrix <- solve(data, ...)

        #Sets the calculated inverse matrix value in the special matrix.
        x$setInverseMatrix(inverseMatrix)
    }

    #Brings back the calculated inverse matrix value.
    inverseMatrix

}
