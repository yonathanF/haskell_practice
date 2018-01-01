double x = x + x
--reusing the functions 
doubleTwo x y = double x + double y
conditionalD x = if x < 100 || x > 200 
                  then x*2
                  else x

--recursive function
myDrop n xs=  if n <=0 || null xs then xs else myDrop (n-1) (tail xs)

--ex
lastButOne lst= head(myDrop ((length lst)-2) lst) 