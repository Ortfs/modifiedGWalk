load "../perturbedWalks.m2" 


-- benchmarks the methods gb, gfanBuchberger and groebnerWalk
-- on random knapsack problems over QQ with n=5 and a_i up to 10^4 


R1 = QQ[t,x1,x2,x3,x4,x5, MonomialOrder =>{Weights => {0,1,1,1,1,1}}]

f1 = x1 - t^(random 10^4)
f2 = x2 - t^(random 10^4)
f3 = x3 - t^(random 10^4)
f4 = x4 - t^(random 10^4)
f5 = x5 - t^(random 10^4)

I = ideal(f1,f2,f3,f4,f5) 

G = gb I 

R2 = QQ[t, x1, x2, x3,x4, x5, MonomialOrder => GLex]


I2 = sub(I, R2)

polylist = {sub(f1,R2), sub(f2,R2), sub(f3,R2), sub(f4,R2), sub(f5,R2)}

t1 = elapsedTiming G1 = gb I2



t2 = elapsedTiming G2 = gfanBuchberger(polylist, "w"=>{1,1,1,1,1,1})

--setWalkTrace 3 

t3 = elapsedTiming G3 = groebnerWalk(G, R2) 


t4 = elapsedTiming G4 = groebnerWalk(G1, R2, Strategy => Generic)

