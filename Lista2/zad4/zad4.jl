using Polynomials

#Poly - creates polynomial from normal form
#poly - creates polynomial from roots
#polyval - calculates polynomial value in point

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

definedRoots = [1.0, 2.0, 3.0, 4.0, 5.0, 6.0, 7.0, 8.0, 9.0, 10.0,
    11.0, 12.0, 13.0, 14.0, 15.0, 16.0, 17.0, 18.0, 19.0, 20.0]

function polynomialFunction(p)
    #reverse order in vector
    p = p[end:-1:1]

    #calculate roots
    calcRoots = roots(Poly(p))

    #polyval from normal version of polynomial p
    println("\n|P(z)|:")
    for i = 1:20
        println("P($i):", abs(polyval(Poly(p), calcRoots[i])))
    end

    #polyval from polynomial from defined roots
    println("\n|p(z)|:")
    for i = 1:20
        println("p($i):", abs(polyval(poly(definedRoots), calcRoots[i])))
    end

    println("\n|z-k|:")
    for i = 1:20
        println("|z$i-k|:", abs(calcRoots[i] - definedRoots[i]))
    end
end

#MAIN
#a
println("Wilkinson's polynomial")
# polynomialFunction(p1)

#b
println("Wilkinson's polynomial with small change")
polynomialFunction(p2)
