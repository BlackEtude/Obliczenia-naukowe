#Agata Jasionowska - 229726

using Polynomials
using Cairo
using Fontconfig
using Gadfly

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

definedRoots = [20.0, 19.0, 18.0, 17.0, 16.0, 15.0, 14.0, 13.0, 12.0, 11.0,
    10.0, 9.0, 8.0, 7.0, 6.0, 5.0, 4.0, 3.0, 2.0, 1.0]


#Work with polynomial 'p'
function polynomialFunction(n, p)
    #reverse order in vector
    p = p[end:-1:1]
    calcRoots = roots(Polynomials.Poly(p))

    #polyval from normal version of polynomial p
    println("\n|P(z)|:")
    A = zeros(20)
    for i = 1:20
        A[i] = abs(polyval(Polynomials.Poly(p), calcRoots[i]))
        println("P($i):", abs(polyval(Polynomials.Poly(p), calcRoots[i])))
    end
    # drawPlot(n, 1, A)

    #polyval from polynomial from defined roots
    println("\n|p(z)|:")
    A = zeros(20)
    for i = 1:20
        A[i] = abs(polyval(Polynomials.poly(definedRoots), calcRoots[i]))
        println("p($i):", abs(polyval(Polynomials.poly(definedRoots), calcRoots[i])))
    end
    # drawPlot(n, 2, A)

    println("\n|z-k|:")
    A = zeros(20)
    for i = 1:20
        A[i] = abs(calcRoots[i] - definedRoots[i])
        println("|z$i-k|:", abs(calcRoots[i] - definedRoots[i]))
    end
    # drawPlot(n, 3, A)
end

#draw plot from vector with label 'j'
function drawPlot(n, j, A)
    X = A * diagm(20:20)
    draw(PNG("zad4/plot$n$j.png", 8inch, 5inch), plot(X, x = Row.index, y = Col.value, Geom.line, Theme(
        panel_fill = "white",
        default_color = "red"
    )))
end

#MAIN
#a
println("Wilkinson's polynomial")
polynomialFunction(1, p1)

#b
println("Wilkinson's polynomial with small change")
polynomialFunction(2, p2)
