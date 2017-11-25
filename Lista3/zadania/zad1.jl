#= Find roots of function f on range [a,b]

PARAMETERS
 f - anonymous function
 [a,b] - range
 delta, epsilon - accurancy of range/value

RETURN
   tuple : (r, v, it, err)
=#
function mbisekcji(f, a::Float64, b::Float64, delta::Float64, epsilon::Float64)
  local r :: Float64
  local mid :: Float64
  local value_a :: Float64
  local value_b :: Float64
  local value_r :: Float64
  local it :: Int
  local err :: Int

  r = 0
  value_r = 0;
  it = 0;
  err = 0
  value_a = f(a)
  value_b = f(b)

  if sign(value_a) == sign(value_b)
    err = 1
    return(r, value_r, it, err)
  end

  middle = b - a
  while middle > epsilon
    it += 1
    middle /= 2.0
    r = a + middle
    value_r = f(r)
    if abs(middle) < delta || abs(value_r) < epsilon
      return (r, value_r, it, err)
    end
    if sign(value_r) != sign(value_a)
      b = r
      value_b = value_r
    else
      a = r
      value_a = value_r
    end
  end
  return (r, value_r, it, err)
end
