--benchmark script for the "lexicographic conversion" ideals
--ideals and rings can be found in "lexideals.m2"

load "../perturbedWalks.m2"  
loadPackage "FGLM"

--Ideals and Rings from "The Groebner walk revisited", chap. 6 may be found in the file "lexideals.m2" 

--add start ring R1

--add ideal I

--add target ring R2


I2 = sub(I, R2)

G = gb I 
t1 = elapsedTiming G1 = gb I2

--setWalkTrace 3 

t2 = elapsedTiming G2 = groebnerWalk(G, R2) 

t3 = elapsedTiming G3 = perturbedWalk(G, R2, 64)

t4 = elapsedTiming hperturbedWalk(G, R2, 64)

t5 = elapsedTiming G5 = groebnerWalk(G, R2, Strategy => Generic)

t6 = elapsedTiming G6 = fglm(G, R2) 
