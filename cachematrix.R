## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function

makeCacheMatrix <- function(x = matrix()) {
    inv <- NULL
    set <- function(y) {
        x <<- y
        inv <<- NULL
    }
    
    get <- function() x
    setInverse <- function(inverse) inv <<- inverse 
    getInverse <- function() inv
    list(set=set, get=get, setInverse=setInverse, getInverse=getInverse)
}


## Write a short comment describing this function
## Need to install matrixcalc package

cacheSolve <- function(x, ...) {
  ## Return a matrix that is the inverse of 'x'
   
   if( !is.singular.matrix(x$get()) ){
    inv <- x$getInverse()
    if(!is.null(inv)) {
      message("getting Cached Matrix Inverse Data.")
      return(inv)
    }
    data <- x$get()
    inv <- solve(data)
    x$setInverse(inv)
    inv
  }
 else {
   message("Singular Matrix doesn't have inverse.")
   inv <- NULL
  }
}


