#Agata Jasionowska - 229726

module blocksys
export readMatrixFromFile, readVectorFromFile, saveResult, computeRightSideVector, gauss, gaussWithPivots,
	matrixToLU, matrixToLUPivots, solveLU, solveLUPivots

#=
	Reads matrix from file
	PARAMS:
    filePath - path to file with matrix

    RETURN:
    (M, n, l):
		M - sparse matrix
		n - matrix size
		l - block size
=#
function readMatrixFromFile(filePath::String)
	open(filePath) do x
		line = split(readline(x))
		n = parse(Int64, line[1])
		l = parse(Int64, line[2])
		v = convert(Int64, n / l)
		size = v * l * l + (v - 1) * 2 * l + (v - 1) * l
		I = Array{Int64}(size)
		J = Array{Int64}(size)
		V = Array{Float64}(size)
		i = 1

		while !eof(x)
			line = split(readline(x))
			J[i] = parse(Int64, line[1])
			I[i] = parse(Int64, line[2])
			V[i] = parse(Float64, line[3])
			i += 1
		end
		M = sparse(I, J, V)
		return (M, n, l)
	end
end

#=
	Reads vector from file
	PARAMS:
    filePath - path to file with vector

    RETURN:
    b - vector
=#
function readVectorFromFile(filePath::String)
	open(filePath) do x
		line = readline(x)
		n = parse(Int64, line)
		b = Array(Float64, n)
		i = 0

		while !eof(x)
			i += 1
			line = readline(x)
			b[i] = parse(Float64, line)
		end
		return b
	end
end

#=
	Saves solution to file
	PARAMS:
    filePath - path to file
	x - vector with result
	n - matrix size
	err - wybór zapisu błędu względnego

    RETURN:
    b - vector
=#
function saveResult(filePath::String, x::Array{Float64}, n::Int64, err::Bool)
	open(filePath, "w") do file
		if err
			exact_solution = ones(n)
			println(file, norm(exact_solution - x) / norm(x))
		end
		for i in 1:n
			println(file, x[i])
		end
	end
end

#=
	Computes right side vector for given matrix
	PARAMS:
	A - sparse matrix
	n - matrix size
	l - block size

    RETURN:
    b - computed right side vector
=#
function computeRightSideVector(A::SparseMatrixCSC{Float64, Int64}, n::Int64, l::Int64)
	b = zeros(Float64, n)
	for i in 1 : n
		sourceC = convert(Int64, max(l * floor((i-1) / l) - 1, 1))
		lastC = convert(Int64, min(l + l * floor((i-1) / l), n))
		for j in sourceC : lastC
			b[i] += A[j, i]
		end

		if (i + l > n)
			b[i] += A[i + l, i]
		end
	end
	return b
end

#=
	Solves system of linear equations with gaussian elimination method
	PARAMS:
	A - sparse matrix
	b - right side vector
	n - matrix size
	l - block size

    RETURN:
    x - result
=#
function gauss(A::SparseMatrixCSC{Float64, Int64}, b::Vector{Float64}, n::Int64, l::Int64)
	for k in 1 : n-1
		lastColumn = convert(Int64, min(k + l, n))
		lastRow = convert(Int64, min(l + l * floor((k+1) / l), n))
		for i in k + 1:lastRow
			if eps(Float64) > abs(A[k, k])
				error("Coefficient on diagonal is 0 - cannot use this method")
			end
			z = A[k, i] / A[k, k]
			A[k, i] = 0
			for j in k + 1:lastColumn
				A[j, i] = A[j, i] - z * A[j, k]
			end
			b[i] = b[i] - z * b[k]
		end
	end

	x = Array{Float64}(n)
	for i in n:-1:1
		sum = 0
		last = min(n, i + l)
		for j in i + 1:last
			sum += A[j, i] * x[j]
		end
		x[i] = (b[i] - sum) / A[i, i]
	end
	return x
end

#=
	Solves system of linear equations with gaussian elimination method with pivot
	PARAMS:
	A - sparse matrix
	b - right side vector
	n - matrix size
	l - block size

    RETURN:
    x - result
=#
function gaussWithPivots(A::SparseMatrixCSC{Float64, Int64}, b::Vector{Float64}, n::Int64, l::Int64)
	p = collect(1:n)

	for k in 1:n - 1
		lastColumn = convert(Int64, min(2*l + l*floor((k+1)/l), n))
		lastRow = convert(Int64, min(l + l * floor((k+1) / l), n))
		for i in k + 1 : lastRow
			maxRow = k
			max = abs(A[k, p[k]])
			for x in i : lastRow
				if (abs(A[k, p[x]]) > max)
					maxRow = x;
					max = abs(A[k, p[x]])
				end
			end
			if eps(Float64) > abs(max)
				error("Singular matrix")
			end
			p[k], p[maxRow] = p[maxRow], p[k]
			z = A[k, p[i]] / A[k, p[k]]
			A[k, p[i]] = 0
			for j in k + 1 : lastColumn
				A[j, p[i]] = A[j, p[i]] - z * A[j, p[k]]
			end
			b[p[i]] = b[p[i]] - z * b[p[k]]
		end
	end

	x = Array{Float64}(n)
	for i in n : -1 : 1
		lastColumn = convert(Int64, min(2 * l + l * floor((p[i] + 1) / l), n))
		sum = 0
		for j in i + 1 : lastColumn
			sum += A[j, p[i]] * x[j]
		end
		x[i] = (b[p[i]] - sum) / A[i, p[i]]
	end
	return x
end

#=
	Performs LU decomposition for given matrix
	PARAMS:
	A - sparse matrix
	n - matrix size
	l - block size
=#
function matrixToLU(A::SparseMatrixCSC{Float64, Int64}, n::Int64, l::Int64)
	for k in 1 : n-1
		lastRow = convert(Int64, min(l + l * floor((k+1) / l), n))
		lastColumn = convert(Int64, min(k + l, n))
		for i in k + 1 : lastRow
			if abs(A[k,k]) < eps(Float64)
				error("Coefficient on diagonal is 0 - cannot use this method")
			end
			z = A[k, i] / A[k, k]
			A[k, i] = z
			for j in k + 1 : lastColumn
				A[j, i] = A[j, i] - z * A[j, k]
			end
		end
	end
end

#=
	Performs LU decomposition with pivot
	PARAMS:
	A - sparse matrix
	n - matrix size
	l - block size

    RETURN:
	p - vector of permutations
=#
function matrixToLUPivots(A::SparseMatrixCSC{Float64, Int64}, n::Int64, l::Int64)
	p = collect(1:n)
	for k in 1:n - 1
		lastRow = convert(Int64, min(l + l * floor((k + 1) / l), n))
		last_col = convert(Int64, min(2 * l + l * floor((k + 1) / l), n))
		for i in k + 1 : lastRow
			max_row = k
			max = abs(A[k, p[k]])
			for x in i : lastRow
				if (abs(A[k, p[x]]) > max)
					max_row = x;
					max = abs(A[k, p[x]])
				end
			end
			if eps(Float64) > abs(max)
				error("Singular maatrix")
			end
			p[k], p[max_row] = p[max_row], p[k]
			z = A[k, p[i]] / A[k, p[k]]
			A[k, p[i]] = z
			for j in k + 1 : last_col
				A[j, p[i]] = A[j, p[i]] - z * A[j, p[k]]
			end
		end
	end
	return p
end

#=
	Solves system of linear equations for LU decomposition
	PARAMS:
	A - sparse matrix
	b - right side vector
	n - matrix size
	l - block size

    RETURN:
	x - soulution
=#
function solveLU(A::SparseMatrixCSC{Float64, Int64}, b::Vector{Float64}, n::Int64, l::Int64)
	z = Array{Float64}(n)
	for i in 1 : n
		sum = 0
		column = convert(Int64, max(l * floor((i - 1) / l) - 1, 1))
		for j in column : i-1
			sum += A[j, i] * z[j]
		end
		z[i] = b[i] - sum
	end

	x = Array{Float64}(n)
	for i in n : -1 : 1
		sum = 0
		lastColumn = min(n, i + l)
		for j in i + 1 : lastColumn
			sum += A[j, i] * x[j]
		end
		x[i] = (z[i] - sum) / A[i, i]
	end
	return x
end

#=
 	Solves system of linear equations for LU decomposition with pivot
	PARAMS:
	A - sparse matrix
	b - right side vector
	n - matrix size
	l - block size
	p - vector of permutations

    RETURN:
	x - solution
=#
function solveLUPivots(A::SparseMatrixCSC{Float64, Int64}, b::Vector{Float64}, n::Int64, l::Int64, p::Vector{Int64})
	z = Array{Float64}(n)
	for i in 1 : n
		sum = 0
		from_col = convert(Int64, max(l * floor((i - 1) / l) - 1, 1))
		for j in from_col : i-1
			sum += A[j, p[i]] * z[j]
		end
		z[i] = b[p[i]] - sum
	end

	x = Array{Float64}(n)
	for i in n : -1 : 1
		sum = 0
		lastColumn = convert(Int64, min(2 * l + l * floor((p[i] + 1) / l), n))
		for j in i + 1 : lastColumn
			sum += A[j, p[i]] * x[j]
		end
		x[i] = (z[i] - sum) / A[i, p[i]]
	end
	return x
end

end
