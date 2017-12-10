# Agata Jasionowska - 229726

#= calculate coefficients of interpolating polynomial (natural form)
    PARAMS:
    x - vector of nodes
    fx - vector of difference quotients

    RETURN:
    a - vector with coefficients
=#
function naturalna(x::Vector{Float64}, fx::Vector{Float64})
    m = length(fx)
    a = Vector{Float64}(m)
    a[m] = fx[m]

    for i = m-1: -1: 1
        p = a[i+1] * x[i]
        a[i] = fx[i] - p
        for k = i+1 : m-1
            p = a[k+1] * x[i]
            a[k] = a[k] - p
        end
    end

    return a
end
