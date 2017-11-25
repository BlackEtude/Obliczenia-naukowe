#= Find roots of function f

PARAMETERS
 f - anonymous function
 x0, x1 - est of beginning
 delta, epsilon - accurancy of range/value
 maxit - max step

RETURN
   tuple : (r, v, it, err)
=#

function msiecznych(f, x0 :: Float64, x1 :: Float64, delta :: Float64, epsilon :: Float64, max_it :: Int)
    local a :: Float64
    local b :: Float64
    local s :: Float64
    local value_a :: Float64
    local value_b :: Float64
    local it :: Int
    local err :: Int

    a = x0
    b = x1
    value_a = f(a)
    value_b = f(b)
    it = 0
    err = 0

    for it = 1: maxit
        if value_a > value_b
            # SWAP (a,b)
            temp = a
            a = b
            b = temp

            #SWAP(value_a, value_b)
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
            return (a, value_a, it_num, err)
        end
    end

    if abs(value_a) > epsilon && abs(b - a) > delta
        err = 1
    end
    return (a, value_a, it_num, err)
end
