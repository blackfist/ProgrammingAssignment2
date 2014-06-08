# Example usage:
# kevin <- matrix(sample.int(10, 25, replace=T), nrow=5, ncol=5)
# cacheableMatrix <- makeCacheMatrix(kevin)
# cacheSolve(cacheableMatrix)

# a special kind of matrix object that allows you to save the 
# results of a previous calculation and recall rather than 
# redoing the calculation every time.

makeCacheMatrix <- function(x = matrix()) {
  # sets the values if a matrix is passed in to the function
  # rather than using the set sub-function
  inverseMatrix <<- NULL
  unInvertedMatrix <<- x
  
  # When the get function is invoked, the cached value is returned
  # which may be NULL if the inverse has not yet been calculated
  set <- function(y) {
    unInvertedMatrix <<- y
    inverseMatrix <<- NULL
  }
  
  # return the original data
  get <- function() unInvertedMatrix
  
  # return the cached inverted matrix
  getInverse <- function() inverseMatrix 
  
  # cache an inverted matrix for later retrieval
  setInverse <- function(inverse) inverseMatrix <<- inverse
  
  # This is the return value for the function, a list where the
  # key is a string and the value is the function with the same
  # string name. That is why we access these functions by
  # typing object$getInverse. Because we are accessing the 
  # getInverse key in a list, which will return the value from
  # the getInverse function.
  list(get=get, set=set, getInverse=getInverse, setInverse=setInverse)

}


# This function accepts a makeCacheMatrix object and will check if
# the object already has a cached solution. If not, then it will 
# calculate the solution and save it for later.

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
  invertedMatrix <- x$getInverse()
  
  # If no previous solution has been saved, then the value of
  # invertedMatrix is NULL.
  if(!is.null(invertedMatrix)) {
    message("getting cached data")
    return(invertedMatrix)
  }
  
  # nobody saved a value, so we'll calculate the solution and
  # save it for later.
  invertedMatrix <- solve(x$get())
  x$setInverse(invertedMatrix)

  # return an answer
  invertedMatrix

}
