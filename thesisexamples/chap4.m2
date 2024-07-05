--computations from the Table 1 of "The Gröbner walk revisited"(pg.37)

--uncommenting "verboseWalk(...)" gives additional information about the various computations

load "../verboseWalks.m2"  

R1var = QQ[x,y,z, MonomialOrder =>{Weights =>{6,3,2}}]
R1 = QQ[x,y,z]
I = ideal(6 + 3*x^3+16*x^2*z+14*x^2*y^3, 6+y^3*z+17*x^2*z^2+7*x*y^2*z^2+13*x^3*z^2)

G1 = gb I  

R2 = QQ[x,y,z, MonomialOrder =>{Weights=>{1,0,0}, Weights => {0,1,0}, Weights => {0,0,1}} ]

R2var = QQ[x,y,z, MonomialOrder =>{Weights=>{445,32,1}}]
I2 = sub(I, R2)
Isigma = sub(I, R1var)
Gsigma = gb Isigma

ttau = elapsedTiming Gtau = groebnerWalk(G1, R2var)

tsigma = elapsedTiming Gs = groebnerWalk(Gsigma, R2)
tsigmatau = elapsedTiming Gst = groebnerWalk(Gsigma, R2var)

--verboseWalk(G1, R2)
--verboseWalk(Gsigma, R2)
--verboseWalk(G1, R2var)
--verboseWalk(Gsigma,R2var)
