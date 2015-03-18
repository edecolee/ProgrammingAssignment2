## Put comments here that give an overall description of what your
## functions do

## This file contains two different functions which are MakeCacheMatrix
## and cacheSolve. This saves the matrix, calculates the inversed matrix and
## stores the inversed matrix in the cache memory for future usage.

## Write a short comment describing this function
## makeCacheMatrix contains 4 different functionality.
## set allows to update the new matrix and clears the stored inversed matrix in the environment
## get allows to display the current matrix
## setinv allows to set the new inverse matrix into the environment
## getinve allows to get the inverse matrix that is stored in the environment
makeCacheMatrix <- function(x = matrix()) {
    inv1 <- NULL
    set <- function(y = matrix()) {
        matrix1 <<- y
        inv1 <<- NULL
    }
    get <- function() x
    setinv <- function(inverse) inv1 <<- inverse
    getinv <- function() inv1
    list(set = set, get = get, setinv = setinv, getinv = getinv)
}


## Write a short comment describing this function
##cacheSolve gets the inverse matrix and chceks whether the valuse exists in the enviroment
## if inverse matrix exist then it grabs the inverse matrix from the cached data
## if inverse matrix does not exist then it calculates the inverse matrix and stores to the cache memory
cacheSolve <- function(x, ...) {
    inv2 <- x$getinv()
    if(!is.null(inv2)) {
        message("getting cached data")
        return(inv2)
    }
    data <- x$get()
    inv2 <- solve(data, ...)
    x$setinv(inv2)
    inv2
}
