using Polynomials

p1 = [1, -210.0, 20615.0, -1256850.0,
    53327946.0, -1672280820.0, 40171771630.0, -756111184500.0,
    11310276995381.0, -135585182899530.0, 1307535010540395.0,
    -10142299865511450.0, 63030812099294896.0, -311333643161390640.0,
    1206647803780373360.0, -3599979517947607200.0, 8037811822645051776.0,
    -12870931245150988800.0, 13803759753640704000.0, -8752948036761600000.0,
    2432902008176640000.0]

p2 = [1, -210.0-(1.0/(2.0^23)), 20615.0, -1256850.0,
    53327946.0, -1672280820.0, 40171771630.0, -756111184500.0,
    11310276995381.0, -135585182899530.0, 1307535010540395.0,
    -10142299865511450.0, 63030812099294896.0, -311333643161390640.0,
    1206647803780373360.0, -3599979517947607200.0, 8037811822645051776.0,
    -12870931245150988800.0, 13803759753640704000.0, -8752948036761600000.0,
    2432902008176640000.0]

n = [1.0, 2.0, 3.0, 4.0, 5.0, 6.0, 7.0, 8.0, 9.0, 10.0,
    11.0, 12.0, 13.0, 14.0, 15.0, 16.0, 17.0, 18.0, 19.0, 20.0]

#1
#reverse order in vector
p1 = p1[end:-1:1]

#calculate roots
calc_roots = roots(Poly(p1))

#polyval from normal version of polynomial p
# for i = 1:20
    # println(abs(polyval(Poly(p1), roots[i])))
# end

#1
# println("P(x) roots: ")
# printVector(getPolyRoots(flipdim(p1, 1)))
# P = Poly(flipdim(p1, 1))
# printVector(A)
# A = roots(P)

#2
# println("p(x) roots:")
# printVector(getPolyRoots(n))

#3 modified index
# println("Modified P(x) roots:")
# printVector(getPolyRoots(flipdim(p2, 1)))

# println("Natural Wilkinson's:")
# for i = 1:20
#     println("P($i) = $(P(A[i]))")
# end


function printVector(V)
    for i = 1:length(V)
        println(V[i])
    end
    println()
end
