## This file contains a set of utility functions for efficient matrix inversion
## The idea is to avoid doing matrix inversion again if operation performed already

## This function returns a special list that conatins a matrix and a cache
## The cache contains an inverted matrix for fuure usage

makeCacheMatrix <- function(x = matrix()) {
m<-NULL;
set <- function(y) { x <<- y ; m <<- NULL; }
get <- function() x
setinverse <- function( inv) m <<- inv;
getinverse <- function() m
list(set = set, get=get, setinverse=setinverse, getinverse = getinverse)
}


## The following function calculates the inverse of the special "matrix" created with the above function. 
## it first checks to see if the inverse has already been calculated. If so, it gets the inverse from
## The cache

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
  mat1 <- x$getinverse()
  if(!is.null(mat1)){ 
    message("getting cached data"); 
    
    }
  else {
    data <- x$get();
  mat1 <- solve( data, ...);
  x$setinverse(mat1);
    }
  mat1;
  }
