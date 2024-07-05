--ideals and rings for the "lexicographic conversion" benchmarks 

--chap4 ideal (Tran2000, example 3.3) 

--over QQ
R1 = QQ[x,y,z]
I = ideal(6 + 3*x^3+16*x^2*z+14*x^2*y^3, 6+y^3*z+17*x^2*z^2+7*x*y^2*z^2+13*x^3*z^2)

R2 = QQ[x,y,z, MonomialOrder =>{Weights=>{1,0,0}, Weights => {0,1,0}, Weights => {0,0,1}} ]

restart

--over F_32003
KK = ZZ/32003
R1 = KK[x,y,z]
I = ideal(6 + 3*x^3+16*x^2*z+14*x^2*y^3, 6+y^3*z+17*x^2*z^2+7*x*y^2*z^2+13*x^3*z^2)

R2 = KK[x,y,z, MonomialOrder =>{Weights=>{1,0,0}, Weights => {0,1,0}, Weights => {0,0,1}} ]

restart


--cyclic5 

--over QQ
R1 = QQ[a,b,c,d,x]

I = ideal( a + b + c + d + x,
a*b + b*c + c*d + d*x + x*a,
a*b*c + b*c*d + c*d*x + d*x*a + x*a*b,
a*b*c*d + b*c*d*x + c*d*x*a + d*x*a*b + x*a*b*c,
a*b*c*d*x - 1 )

R2 = QQ[a,b,c,d,x, MonomialOrder => Lex]

restart

--over F_32003
KK = ZZ/32003
R1 = KK[a,b,c,d,x]

I = ideal( a + b + c + d + x,
a*b + b*c + c*d + d*x + x*a,
a*b*c + b*c*d + c*d*x + d*x*a + x*a*b,
a*b*c*d + b*c*d*x + c*d*x*a + d*x*a*b + x*a*b*c,
a*b*c*d*x - 1 )

R2 = KK[a,b,c,d,x, MonomialOrder => Lex]

restart

--cyclic6 

--over QQ
R1 = QQ[z0,z1,z2,z3,z4,z5] 

I = ideal(       z0 + z1 + z2 + z3 + z4 + z5,
      z0*z1 + z1*z2 + z2*z3 + z3*z4 + z4*z5 + z5*z0,
      z0*z1*z2 + z1*z2*z3 + z2*z3*z4 + z3*z4*z5 + z4*z5*z0 + z5*z0*z1,
      z0*z1*z2*z3 + z1*z2*z3*z4 + z2*z3*z4*z5 + z3*z4*z5*z0 + z4*z5*z0*z1 
      + z5*z0*z1*z2,
      z0*z1*z2*z3*z4 + z1*z2*z3*z4*z5 + z2*z3*z4*z5*z0 + z3*z4*z5*z0*z1 
      + z4*z5*z0*z1*z2 + z5*z0*z1*z2*z3,
      z0*z1*z2*z3*z4*z5 - 1 )

R2 = QQ[z0,z1,z2,z3,z4,z5, MonomialOrder => {Weights =>{1,0,0,0,0,0}, Weights => {0,1,0,0,0,0}, Weights =>{0,0,1,0,0,0,0}, Weights => {0,0,0,1,0,0}, Weights =>{0,0,0,0,1,0}, Weights => {0,0,0,0,0,1} }]

restart

--over F_32003
KK = ZZ/32003
R1 = KK[z0,z1,z2,z3,z4,z5] 

I = ideal(       z0 + z1 + z2 + z3 + z4 + z5,
      z0*z1 + z1*z2 + z2*z3 + z3*z4 + z4*z5 + z5*z0,
      z0*z1*z2 + z1*z2*z3 + z2*z3*z4 + z3*z4*z5 + z4*z5*z0 + z5*z0*z1,
      z0*z1*z2*z3 + z1*z2*z3*z4 + z2*z3*z4*z5 + z3*z4*z5*z0 + z4*z5*z0*z1 
      + z5*z0*z1*z2,
      z0*z1*z2*z3*z4 + z1*z2*z3*z4*z5 + z2*z3*z4*z5*z0 + z3*z4*z5*z0*z1 
      + z4*z5*z0*z1*z2 + z5*z0*z1*z2*z3,
      z0*z1*z2*z3*z4*z5 - 1 )

R2 = KK[z0,z1,z2,z3,z4,z5, MonomialOrder => {Weights =>{1,0,0,0,0,0}, Weights => {0,1,0,0,0,0}, Weights =>{0,0,1,0,0,0,0}, Weights => {0,0,0,1,0,0}, Weights =>{0,0,0,0,1,0}, Weights => {0,0,0,0,0,1} }]

restart

--katsura6 

--over QQ

R1 = QQ[x1,x2,x3,x4,x5,x6,x7] 

I = ideal(         1*x1+2*x2+2*x3+2*x4+2*x5+2*x6+2*x7-1,
        2*x4*x3+2*x5*x2+2*x6*x1+2*x7*x2-1*x6,
        1*x3^2+2*x4*x2+2*x5*x1+2*x6*x2+2*x7*x3-1*x5,
        2*x3*x2+2*x4*x1+2*x5*x2+2*x6*x3+2*x7*x4-1*x4,
        1*x2^2+2*x3*x1+2*x4*x2+2*x5*x3+2*x6*x4+2*x7*x5-1*x3,
        2*x2*x1+2*x3*x2+2*x4*x3+2*x5*x4+2*x6*x5+2*x7*x6-1*x2,
        1*x1^2+2*x2^2+2*x3^2+2*x4^2+2*x5^2+2*x6^2+2*x7^2-1*x1 )
  

R2 = QQ[x1,x2,x3,x4,x5,x6,x7, MonomialOrder => {Weights =>{1,0,0,0,0,0,0}, Weights => {0,1,0,0,0,0,0}, Weights =>{0,0,1,0,0,0,0,0}, Weights => {0,0,0,1,0,0,0}, Weights =>{0,0,0,0,1,0,0}, Weights => {0,0,0,0,0,1,0}, Weights =>{0,0,0,0,0,0,1}}]

restart


--over F_32003
KK = ZZ/32003
R1 = [x1,x2,x3,x4,x5,x6,x7] 

I = ideal(         1*x1+2*x2+2*x3+2*x4+2*x5+2*x6+2*x7-1,
        2*x4*x3+2*x5*x2+2*x6*x1+2*x7*x2-1*x6,
        1*x3^2+2*x4*x2+2*x5*x1+2*x6*x2+2*x7*x3-1*x5,
        2*x3*x2+2*x4*x1+2*x5*x2+2*x6*x3+2*x7*x4-1*x4,
        1*x2^2+2*x3*x1+2*x4*x2+2*x5*x3+2*x6*x4+2*x7*x5-1*x3,
        2*x2*x1+2*x3*x2+2*x4*x3+2*x5*x4+2*x6*x5+2*x7*x6-1*x2,
        1*x1^2+2*x2^2+2*x3^2+2*x4^2+2*x5^2+2*x6^2+2*x7^2-1*x1 )

R2 = ZZ/32003[x1,x2,x3,x4,x5,x6,x7, MonomialOrder => {Weights =>{1,0,0,0,0,0,0}, Weights => {0,1,0,0,0,0,0}, Weights =>{0,0,1,0,0,0,0,0}, Weights => {0,0,0,1,0,0,0}, Weights =>{0,0,0,0,1,0,0}, Weights => {0,0,0,0,0,1,0}, Weights =>{0,0,0,0,0,0,1}}]

restart




