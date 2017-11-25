#= Find roots of function f

PARAMETERS
 f - anonymous function
 pf - derivative of f
 x0 - est of beginning
 delta, epsilon - accurancy of range/value
 maxit - max step

RETURN
   tuple : (r, v, it, err)
=#

function mstycznych(f, pf, x0 :: Float64, delta :: Float64, epsilon :: Float64, maxit :: Int)
   local r :: Float64
   local x :: Float64
   local value_r :: Float64
   local value_x :: Float64
   local it :: Int
   local err :: Int

   r = x0
   value_r = f(r)
   it = 0
   err = 0

   if abs(pf(r)) < epsilon
      err = 2
      return (r, value_r, it, err)
   end

   for it = 1 : maxit
      x = r - (value_r / pf(r))
      value_r = f(x)
      if abs(r-x) < delta || abs(value_r) < epsilon
         r = x
         return (r, value_r, it, err)
      end
      r = x
   end
   if abs(value_r) > epsilon
      err = 1
   end

   return (r, value_r, it, err)
end
