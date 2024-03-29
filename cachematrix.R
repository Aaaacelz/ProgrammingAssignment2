## Matrix inversion is usually a costly computation
## caching the inverse of a matrix is more benefit than computing it repeatedly
##write a pair of functions to cache the inverse of a matrix 

## This function creates a special "matrix" object to cache its inverse
makeCacheMatrix <- function(x = matrix()) {
  i <- NULL
  set <- function(z){
    x <<- z
    i <<- NULL 
  }
  get <- function() x
  setinverse <- function(inverse) i <<- inverse
  getinverse <- function() i
  list(set = set, get = get, setinverse = setinverse, getinverse = getinverse)
}


## This function computes the inverse of the special "Matrix" object
## retrieve the inverse from the cache 

cacheSolve <- function(x, ...) {
  i <- x$getinverse()
  if(!is.null(i)){
          message("getting cached data")
    ## Return a matrix that is the inverse of 'x'
          return(i)
  }
  data <- x$get()
  i <- solve(data,...)
  x$setinverse(i)
  i
}
