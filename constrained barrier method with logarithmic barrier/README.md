# constrained barrier method with logarithmic barrier

The code tries to solve the following problem:

 Implement a constrained barrier method with logarithmic barrier. Make it able to explicitly
compute the gradients and Hessians of the modified objectives based on the exact gradients
and Hessians of the gi contraint functions, given as input, and use Newton’s method as the
unconstrained subroutine. You may use the code for the Carrol barrier (barrier_path.m)
as reference.