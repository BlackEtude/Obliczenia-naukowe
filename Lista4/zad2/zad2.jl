# Agata Jasionowska - 229726

#= calculate polynomial value with Newton form using Horner algorithm
    PARAMS:
    x - vector with nodes
    fx - vector of difference quotients
    t - polynomial point where we calc value

    RETURN:
    nt - polynomial value in t
=#
function warNewton(x :: Vector{Float64}, fx :: Vector{Float64}, t :: Float64)
    m = length(fx)
    nt = fx[m]

	for i = m - 1: -1: 1
		nt = fx[i] + (t - x[i]) * nt
	end

    return nt
end
