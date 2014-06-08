## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function
# The makeCacheMatrix function will store the inverse of the 
# given matrix in a variable called inverseMatrix.

makeCacheMatrix <- function(x = matrix()) {
  inverseMatrix <- NULL
  
  # When the get function is invoked, the cached value is returned
  # which may be NULL if the inverse has not yet been calculated
  set <- function(y) {
    unInvertedMatrix <<- y
    inverseMatrix <<- NULL
  }
  
  get <- function() unInvertedMatrix
  
  getInverse <- function() inverseMatrix 
  
  setInverse <- function(inverse) inverseMatrix <<- inverse
  
  # I still don't know what this part does exactly, but without it you
  # get errors: object of type 'closure' is not subsettable
  # this might be what exports the sub functions of the function
  list(get=get, set=set, getInverse=getInverse, setInverse=setInverse)

}


## Write a short comment describing this function

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
}
