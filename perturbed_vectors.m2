load "./common.m2" 

--Different types of perturbed vectors, depending on different degree bounds for the target monomial order

-- computation of the eps-perturbed vector with the Dubé bound

epsilonPerturb = method()

epsilonPerturb(List, QQ) := List => (L, eps) -> (
    --input: a list of lists L, a quantity eps
    --output: the list which is the sum of rows of L, perturbed by eps
    weps := matrix {L#0};
    for i from 1 to #L#0-1 do(
	weps = weps + (eps^i)*matrix{L#i};
	);
    return weps 
    
    )

epsPerturbedVector = method()

epsPerturbedVector(Ring, GroebnerBasis) := List => (R, G) -> (
        -- A ring R with monomial order Matrix A
        -- Any Groebner basis of the desired ideal
        -- returns an interior vector of the groebner cone corresponding to R


       A := weightVectors R;
       M1 := LargestEntry(A);
       M2 := DegreeBound(G);
       eps := (M1*M2)^(-1);
       w := epsilonPerturb(A,eps);
       w = first entries ( w // gcd first entries w) 

       )


--computation of the d-perturbed vector with the Dubé bound

dPerturb = method()

dPerturb(List, ZZ) := List => (L, d) -> (
    --input: a list of lists L, a (large) quantity d
    --output: the list which is the sum of rows of L, perturbed by d
    n :=  #L#0;
    wd := matrix { toList(n:0) }; 
    for i from 0 to n-1  do(
	wd = wd + (d^(n-i-1))*matrix{ L#i };
	);
    return first entries wd
    )

dPerturbedVector = method()

dPerturbedVector(Ring, GroebnerBasis) := List => (R, G) -> (
       -- A ring R with monomial order Matrix A
        -- Any Groebner basis of the desired ideal
        -- returns an interior vector of the groebner cone corresponding to R


       A := weightVectors R;
       M1 := LargestEntry(A);
       M2 := DegreeBound(G);
       d := M1*M2;
       w := dPerturb(A,d) 

       )
   

--computes the bound from theorem 4.1 of Tran (depends on length of walk
   

TranBound = method()
    	--input:- the amount of steps in the Gröbner walk l
	--      - a degree bound for the given generating set
	--    	- the number of variables n
	--output: the Tran bound
TranBound(ZZ, ZZ, ZZ) := ZZ => (l, d, n) -> (
    b = 2^(2^(l-1))*d^(2^l) + 2^(2^(l+1))*d*(n+1)*(d+1)^(2^l -2)*(n+2)^(2^(l-1)-1);
    return b
    )


TranPerturbedVector = method()

TranPerturbedVector(Ring, GroebnerBasis, ZZ) := List => (R, G, l ) -> (
        -- A ring R with target monomial matrix A
        -- The starting Gröbner basis G
	-- The amount of conversions computed so far l
	
        -- returns an interior vector of the groebner cone corresponding to R


       A := weightVectors R;
       maxdeg = MaxDeg(G);
       n = numgens ring G;
       d = TranBound(l, maxdeg, n);
       w := dPerturb(A,d) 

       )
   
   
--a "heuristically perturbed" vector
hBound = method()

hBound(GroebnerBasis) := ZZ => (G) -> (
    n = numgens ring G;
    Glist = flatten entries gens G;
    M = first max(apply(Glist, degree));
    bound = (M)^(2^(n-1))
    )

hPerturbedVector = method()

hPerturbedVector(Ring, GroebnerBasis) := List => (R, G) -> (
       -- A ring R with monomial order Matrix A
        -- Any Groebner basis of the desired ideal
        -- returns a heuristically perturbed vector (hopefully) in the target cone


       A := weightVectors R;
       M1 := LargestEntry(A);
       M2 := hBound(G);
       d := M1*M2;
       w := dPerturb(A,d) 

       )


