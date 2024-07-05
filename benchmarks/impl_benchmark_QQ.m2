load "../perturbedWalks.m2" 

--Benchmark template for implicitization examples (over QQ)

R1 = QQ[x,y,z,u,v, MonomialOrder =>{Weights =>{1,1,1,0,0}, Weights =>{0,0,0,1,1}, Weights =>{0,0,0,1,0}, Weights =>{1,1,0,0,0}, Weights =>{1,0,0,0,0}}]


--Insert ideal I from "impl_ideals.m2" here


G = gb I 

R2 = QQ[x,y,z,u,v, MonomialOrder =>{Weights =>{0,0,0,1,1}, Weights =>{1,1,1,0,0}, Weights =>{1,1,0,0,0}, Weights =>{1,0,0,0,0}, Weights =>{0,0,0,1,0}}]

I2 = sub(I, R2) 
 

t1 = elapsedTiming G1 = gb I2

--setWalkTrace 3 
t2 = elapsedTiming G2 = groebnerWalk(G, R2) 

t3 = elapsedTiming G3 = groebnerWalk(G, R2, Strategy => Generic )

t4 = elapsedTiming G4 = perturbedWalk(G, R2, 16)

t5 = elapsedTiming G5 = hperturbedWalk(G, R2, 64)

--gens G5 == gens G3
