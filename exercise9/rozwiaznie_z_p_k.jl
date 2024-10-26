function rozwiazanie_7(;
    zz::Vector{ComplexF64} = ComplexF64[1.0 + 0.0im, 1.0 + 0.0im, 1.0 + 0.0im, 1.0 + 0.0im, 1.0 + 0.0im, -1.0 + 0.0im, -1.0 + 0.0im, -1.0 + 0.0im, -1.0 + 0.0im, -1.0 + 0.0im],
    pp::Vector{ComplexF64} = ComplexF64[0.6652063925694924 - 0.7373627295629914im, 0.44091020076853477 + 0.8882445675650442im, 0.6652063925694924 + 0.7373627295629914im, 0.44091020076853477 - 0.8882445675650442im, 0.6216260870007383 - 0.7589965232532138im, 0.4834624053735787 + 0.8510065827038683im, 0.6216260870007383 + 0.7589965232532138im, 0.4834624053735787 - 0.8510065827038683im, 0.5537560542846959 - 0.8025378130272126im, 0.5537560542846959 + 0.8025378130272126im],
    k::Float64 = 3.2891429958087667e-6,
    F::Vector{Float64} = [0.04, 0.15, 0.16, 0.17, 0.31, 0.47],
)
    omega=exp.(im*2*pi*F)
    H=ones(ComplexF64, length(F))
    for j in eachindex(F)
        Z=1
        for i in eachindex(zz)
            Z*=omega[j]-zz[i]
        end
        P=1
        for i in eachindex(pp)
            P*=omega[j]-pp[i]
        end
        H[j]=k*Z/P
    end
    #return sum(abs.(H))/length(F) #wzmocnienie
    return sum(angle.(H))/length(F) #przesunięcie fazowe
end
rozwiazanie_7()