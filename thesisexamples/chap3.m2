load "../verboseWalks.m2"

R1 = QQ[x,y,z]
I1 = ideal(x^2 + y*z, x*y + z^2)
G1 =  gb I1
R2 = QQ[x,y,z, MonomialOrder => Lex]

G2 = verboseWalk(G1, R2) 

--psigma = dPerturbedVector(R1, G1) 

--ptau = dPerturbedVector(R2, G1) 

--the perturbations above are vectors which are too long to be weight vectors in M2.
--Thus, we try a heuristic perturbation 

--psigma = hPerturbedVector(R1, G1) 
--ptau = hPerturbedVector(R2, G1) 

--the heuristic perturbation works. We could also try the naive bound with the given generating set: 


psigma = dPerturbedVector(R1, forceGB gens I1) 

ptau = dPerturbedVector(R2, forceGB gens I1 ) 

R1p = QQ[x,y,z, MonomialOrder =>{ Weights => psigma}]

R2p = QQ[x,y,z, MonomialOrder =>{ Weights => ptau}]

I1p = sub(I1, R1p)

G1p = gb I1p

verboseWalk(G1p, R2p)

--R3 =  QQ[x,y,z, MonomialOrder =>{ Weights => {1234567891,1234567891,1234567891}}]

-- M2 only allows for weight vectors with entries of length up to 10, As soon as I start walking I have a problem
-- (The weight vectors get bigger!)

gfanlist = gfan I1

maxdegree = max(apply(gfanlist, MaxDegMPL))

H1 = matrix boundingVectors(G1) 

C1 = coneFromHData H1 

H2 = matrix boundingVectors(G2) 

C2 = coneFromHData H2 
