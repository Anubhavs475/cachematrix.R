makeCacheMatrix <- function(x = matrix()) {
  
   cacheMatrix <- NULL
  
   setMatrix <- function(y) {
    x <<- y
    cacheMatrix <<- NULL
  }
    
  getMatrix <- function() x
    
  setCache <- function(inverse) cacheMatrix <<- inverse
  
   getCache <- function() cacheMatrix
  
   list(setMatrix = setMatrix,
       getMatrix = getMatrix,
       setCache = setCache,
       getCache = getCache)
  
  }
cacheSolve <- function(x, ...) {
  
  cacheMatrix <- x$getCache()
  
   if (!is.null(cacheMatrix)) {
    message("loading the matrix...")
    return(cacheMatrix)
  }
  
    else {
    dMatrix <- x$getMatrix()
    cacheMatrix <- solve(dMatrix, ...)
    x$setCache(cacheMatrix)
    return(cacheMatrix)
  }
  }