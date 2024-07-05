load "../verboseWalks.m2"

R1 = QQ[x,y,z, MonomialOrder => Lex]
I1 = ideal(x^2 + y*z, x*y + z^2)
G1 =  gb I1
R2 = QQ[x,y,z, MonomialOrder => {Weights=>{1,3,0}} ]

G2 = verboseWalk(G1, R2) 

