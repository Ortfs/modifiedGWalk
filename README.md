# modifiedGWalk
Macaulay2 code from my master's thesis "The Gröbner walk revisited". 

The folder "thesisexamples" contains the computations from the running examples in sections 3 and 4. The computations may be replicated by running the corresponding file in Macaulay2. 

The folder "benchmarks" contains computations for the benchmarks discussed in section 6. 

To execute a lexicographic conversion benchmark on your machine (eg. cyclic5), copy the corresponding starting ring, ideal and target ring from the file "lexideals.m2", and paste it into the file "lex_benchmark.m2". Then, run the file in Macaulay2 to get the runtimes of the various algorithms. 

To execute an implicitization benchmark (eg. agk4), copy the corresponding ideal from "impl_ideals.m2" into either "impl_benchmark_QQ.m2" (for computations over the rationals) or "impl_benchmark_FF.m2" (for computations over the field ZZ/32003ZZ). 

The files "random_knap.m2" and "random_toric.m2" may be simply run to obtain timings of the various algorithms on randomly generated knapsack and toric ideals respectively.    
