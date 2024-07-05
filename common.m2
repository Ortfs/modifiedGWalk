loadPackage "GroebnerWalk"
debug GroebnerWalk
loadPackage "gfanInterface"

--A series of helper functions necessary for both the perturbed and verbose Walks.

gconeInteriorPoint = method()
gconeInteriorPoint(GroebnerBasis) := List => (G) -> (
    --input: A Gröbner basis G
    --output: An interior point of the Gröbner cone of G, calculated with linear methods
    
    BVG := boundingVectors(G);
    gcone := coneFromHData(matrix BVG);
    intvmatrix := interiorVector gcone;
    flatten entries intvmatrix
    

    )

isRepresenting = method()

isRepresenting(GroebnerBasis, List) := Boolean => (G, L) -> (
    -- input: a Gröbner basis G, a list L 
    -- output: a boolean. True if w is in the interior of the gröbner cone of G, false otherwise. 
    BVG := boundingVectors(G);
    output := true;
    for v in BVG do(
	if dot(v, L) > 0 then continue;
            return false;
	);
    return output;
    )
        

lenlongestpol = method()

lenlongestpol(List) := ZZ => (L) -> (
    --input: a list of polynomials L (flatten entries gens G)
    --output: the maximum number of terms of an element of L 
    lens := for p in L list (
        length terms p 
        );
    max lens
    )

lenlongestcoeff = method()

lenlongestcoeff(RingElement) := ZZ => (f) -> (
    --input: A polynomial f
    --output: A
    (M,C) := coefficients f;
    l := first entries  transpose C;
    strings  = apply(l, toString);
    max apply(strings, length)
    )

maxlencoeffs = method()
maxlencoeffs(List) := ZZ => (L) -> (
    --input: a list of polynomials L 
    --output: the length of the largest coefficient of a polynomial in L 
    max apply(L, lenlongestcoeff) 
    )



inw = method()

inw(GroebnerBasis, List) := List => (G,w) -> (
    Gl := flatten entries gens G;
    inwGl = gfanInitialForms(Gl, w) 
    )

DegreeBound = method()

DegreeBound(GroebnerBasis) := ZZ => (G) -> (
    -- input: a Gröbner basis G
    -- output: a maximum degree bound for ANY Gröbner basis of the same ideal
    n = numgens ring G;
    Glist = flatten entries gens G;
    M = first max(apply(Glist, degree));
    bound = (M^2 +2*M)^(2^(n -1))
    )


InftyNorm = method()

InftyNorm(List) := QQ => (L) -> (
  --input: a vector in list form
  --output: the infinity norm of v
  norm := max apply(L, abs)
  )


LargestEntry = method()

LargestEntry(List) := QQ => (L) -> (

    -- input: a list of lists (in practice, weightVectors(R))
    -- output: the maximal infinity norm out of the lists

    q := apply(L, InftyNorm);
    max q
    )


MaxDeg = method()

MaxDeg(GroebnerBasis) := ZZ => (G) -> (
    -- input: a Gröbner basis G
    -- output: the largest total degree of an element of G
    Glist = flatten entries gens G;
    M = first max(apply(Glist, degree))
    )


MaxDegMPL = method()
MaxDegMPL(MarkedPolynomialList) := ZZ => G -> (
    -- input: A GB as a MPL
    -- output: largest total degree of an element of G
    gensmatrix = (matrix G)^{1}; 
    Glist = flatten entries gensmatrix; 
    M = first max(apply(Glist, degree))
    )




