# overall the functions below produce a Matrix Inversion

# makeCacheMatrix is a function that creates a special "matrix" object
#                 that can cache its inverse.

makeCacheMatrix <- function(x = matrix()) {
        i <- NULL
        set <- function(y) {
                x <<- y
                i <<- NULL
        }
        get <- function() x
        setinverse <- function(inverse) i <<- inverse
        getinverse <- function() i
        list(set = set, get = get,
             setinverse = setinverse,
             getinverse = getinverse)
}


# cacheSolve is a function that computes the inverse of the special "matrix" 
#            returned by makeCacheMatrix above. If the inverse has already been 
#            calculated (and the matrix has not changed), then the cachesolve should 
#            retrieve the inverse from the cache.

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
        i <- x$getinverse()
        if(!is.null(i)) {
             message("getting cached data")
             return(i)
        }
        matrixdata <- x$get()
        i <- solve(matrixdata, ...)
        x$setinverse(i)
        i
}
