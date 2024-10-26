using CairoMakie
function dft(signal)

    N = length(signal)
    zeta = exp(-2*pi*im / N)
 
    [
       sum((
          signal[n + 1]*zeta^(f*n)
          for n in 0:(N - 1)
       ))
       for f in 0:(N - 1)
    ]
 
 end
n=1:1:43
fp = 473
Δf=fp/length(x)
f=[154, -165, -11, 165]
Δt=1/1548
x = ComplexF64[0.19 + 0.59im, -0.24 + 1.68im, -0.13 + 0.45im, -0.2 - 0.48im, -0.29 + 0.03im, 0.72 - 0.9im, -0.17 + 0.33im, 0.55 - 0.54im, 1.35 - 1.08im, 0.65 + 0.18im, 0.4 - 0.89im, 0.27 - 0.73im, -0.23 + 0.28im, 1.49 + 1.8im, -0.47 - 0.29im, 0.0 + 0.36im, -0.75 - 0.71im, 0.62 - 0.91im, -0.13 + 0.62im, -1.41 + 0.5im, -0.36 + 0.95im, -0.59 + 1.04im, -0.5 - 0.81im, -0.21 + 0.33im, 1.8 - 0.47im, 0.01 + 0.62im, 0.48 - 1.1im, -0.62 - 0.07im, -0.74 - 0.66im, -0.58 + 0.32im, 0.21 - 0.1im, -0.39 - 0.01im, -0.93 + 0.73im, -0.02 + 0.16im, 0.03 - 0.35im, 0.79 - 0.72im, 0.03 - 1.71im, 0.13 - 0.15im, 0.41 + 0.78im, 1.15 + 0.15im, -0.74 - 0.11im, -0.17 + 0.71im, -1.42 + 0.56im]
f=f./Δf
xx=dft(x)
println(f)
x1=atan(imag(xx[15]),real(xx[15]))
x2=atan(imag(xx[16]),real(xx[16]))
x3=atan(imag(xx[29]),real(xx[29]))
x4=atan(imag(xx[43]),real(xx[43]))
println(x1+x2+x3+x4)
lines(n,abs.(xx))


