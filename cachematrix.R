## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function
  ##This function will allow user to create a matrix using superassignment operator that work
  ##across environments.

makeCacheMatrix <- function(x = matrix()) {
  i <- NULL
  set <- function(y) {
    x <<- y
    i <<- NULL
  }
  get <- function() x
  setinverse <- function(inverse) i <<- inverse
  getinverse <- function() i
  list(set = set,get = get,setinverse = setinverse,getinverse = getinverse)
}



## Write a short comment describing this function
  ##This function is inverting a cached matrix created in above function

cacheSolve <- function(x, ...) {
  i <- x$getinverse()
  if (!is.null(i)) {
    message("getting cached data")
    return(i)
  }
  data <- x$get()
  i <- solve(data, ...)
  x$setinverse(i)
  i
}


