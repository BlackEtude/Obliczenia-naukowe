#Agata Jasionowska - 229726

module roots_module

export mbisekcji
export mstycznych
export msiecznych

#= Find roots of function f on range [a,b]

PARAMETERS
 f - anonymous function
 [a,b] - range
 delta, epsilon - accurancy of range/value

RETURN
   tuple : (r, v, it, err)
=#
function mbisekcji(f, a::Float64, b::Float64, delta::Float64, epsilon::Float64)
  r = 0
  w = 0;
  it = 0;
  err = 0
  u = f(a)
  v = f(b)

  e = b - a
  if sign(u) == sign(v)
    err = 1
    return(r, w, it, err)
  end

  while e > epsilon
    it += 1
    e /= 2.0
    r = a + e
    w = f(r)
    if abs(e) < delta || abs(w) < epsilon
      return (r, w, it, err)
    end
    if sign(w) != sign(u)
      b = r
      v = w
    else
      a = r
      u = w
    end
  end
  return (r, w, it, err)
end


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


#= Find roots of function f

PARAMETERS
 f - anonymous function
 x0, x1 - est of beginning
 delta, epsilon - accurancy of range/value
 maxit - max step

RETURN
   tuple : (r, v, it, err)
=#

function msiecznych(f, x0 :: Float64, x1 :: Float64, delta :: Float64, epsilon :: Float64, maxit :: Int)
    a = x0
    b = x1
    value_a = f(a)
    value_b = f(b)
    it = 0
    err = 0

    for it = 1: maxit
        if value_a > value_b
            temp = a
            a = b
            b = temp

            temp = value_a
            value_a = value_b
            value_b = temp
        end

        s = (b - a) / (value_b - value_a)
        b = a
        value_b = value_a

        a -= value_a * s
        value_a = f(a)

        if abs(value_a) < epsilon || abs(b - a) < delta
            return (a, value_a, it, err)
        end
    end

    if abs(value_a) > epsilon && abs(b - a) > delta
        err = 1
    end
    return (a, value_a, it, err)
end

end
