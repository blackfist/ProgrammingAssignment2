# Example usage
# kevin <- matrix(sample.int(10, 25, replace=T), nrow=5, ncol=5)
# cacheableMatrix <- makeCacheMatrix(kevin)
# cacheSolve(cacheableMatrix)


makeCacheMatrix <- function(x = matrix()) {
  inverseMatrix <<- NULL
  unInvertedMatrix <<- x
  
  # When the get function is invoked, the cached value is returned
  # which may be NULL if the inverse has not yet been calculated
  set <- function(y) {
    print("set has been called")
    unInvertedMatrix <<- y
    inverseMatrix <<- NULL
  }
  
  get <- function() unInvertedMatrix
  
  getInverse <- function() inverseMatrix 
  
  setInverse <- function(inverse) inverseMatrix <<- inverse
  
  # This is the return value for the function, a list where the
  # key is a string and the value is the function with the same
  # string name. That is why we access these functions by
  # typing object$getInverse. Because we are accessing the 
  # getInverse key in a list, which will return the value from
  # the getInverse function.
  list(get=get, set=set, getInverse=getInverse, setInverse=setInverse)

}


## Write a short comment describing this function

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
  invertedMatrix <- x$getInverse()
  if(!is.null(invertedMatrix)) {
    message("getting cached data")
    return(invertedMatrix)
  }
  invertedMatrix <- solve(x$get())
  x$setInverse(invertedMatrix)
  invertedMatrix

}
