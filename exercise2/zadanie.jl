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

 function rozwiazanie(;
   fp::Int = 975,
    x::Vector{ComplexF64} = ComplexF64[-1.43 + 0.55im, -1.11 + 1.08im, -1.15 + 0.58im, 0.33 - 0.19im, 0.08 + 0.35im, 0.66 - 0.56im, -0.56 + 0.19im, -0.01 - 0.88im, 0.07 + 1.46im, 0.13 + 0.04im, -0.74 + 0.41im, -0.16 - 0.66im, -0.81 - 0.75im, -1.42 + 0.46im, -0.76 - 0.11im, -1.03 + 0.29im, -1.18 - 0.45im, -0.29 - 0.84im, 0.15 - 0.22im, 0.16 - 0.17im, -0.75 + 0.6im, -1.18 - 0.68im, -0.13 + 0.67im, 0.45 - 0.27im, -0.11 + 0.01im],
    f::Vector{Int} = [-312, -273, 39],
)
   #0.6498693869615755
   n=1:1:length(x)
   Δt=1/fp
   Δf=fp/length(x)
   f=f./Δf
   for i in 1:length(f)
      if f[i]>=0
         f[i]=f[i]+1
      else
         f[i]=length(x)+f[i]+1
      end
   end
   xx=dft(x)
   A=0   #AMPLITUDA                               
   for i in f
      A += abs(xx[Int(i)])/length(x)
   end
   println(A)
   F=0   #FAZAAAA
   for i in f
      F += angle(xx[Int(i)])
   end
   println(F)
end

rozwiazanie()

