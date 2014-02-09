Freq
====

Freq is a trivial Haskell library for computing frequencies of integers
and the distribution of combinatorial statistics. As illustrated by the
following ghci session you can, for instance, easliy compute the
distribution of descents over all permutations of any given (small)
length:

````
> :m +Math.Freq 
> let des xs = sum [ 1 | (x,y) <- zip xs (tail xs), x > y ]
> mapM_ (print . dist des . permutations . enumFromTo 1) [1..5]
[1]
[1,1]
[1,4,1]
[1,11,11,1]
[1,26,66,26,1]
````
