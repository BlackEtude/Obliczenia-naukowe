# Agata Jasionowska - 229726

#= calculate difference quotients
    PARAMS:
    x - vector of nodes
    f - vector of values of function f

    RETURN:
    fx - vector of computed difference quotients
=#
function ilorazyRoznicowe(x :: Vector{Float64}, f :: Vector{Float64})
    m = length(f)
    fx = Vector{Float64}(m)

    for i = 1: m
        fx[i] = f[i]
    end

    # calculate difference quotients
    for i = 2: m
		for j = m: -1: i
			fx[j] = (fx[j] - fx[j - 1]) / (x[j] - x[j - i + 1])
		end
	end

    return fx
end
