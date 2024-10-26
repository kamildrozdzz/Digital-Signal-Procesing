function rozwiazanie_7(;
    b::Vector{Float64} = [0.22584470649977734, -0.6349728287680964, 0.6349728287680964, -0.22584470649977734],
    a::Vector{Float64} = [1.0, -0.3118356051518374, 0.3753394328747504, -0.03446003250915917],
    F::Vector{Float64} = [0.04, 0.28, 0.49],
)
    omega=exp.(im*2*pi*F)
    H=ones(ComplexF64,length(F))
    for i in eachindex(H)
        B=0
        for j in eachindex(b)
            B+=b[j]*(omega[i]^(length(b)-j))
        end
        A=0
        for j in eachindex(b)
            A+=a[j]*(omega[i]^(length(a)-j))
        end

        H[i]=B/A
    end
    return sum(abs.(H))/length(F) #wzmocnienie
    #return sum(angle.(H))/length(F) #przesunięcie fazowe
end
rozwiazanie_7()