function rozwiazanie(;
    x::Vector{Float64} = [2.56, 2.21, -3.44, -3.21, -1.7, 2.27, -0.59, 2.13, 2.65, 4.59, 1.17, -1.28, 4.04, 4.66, -4.26, -3.49, -3.09, -2.87, 3.65, -1.51, -1.89, 1.27, 0.75, -4.92, 2.95, 3.02, 0.42, -1.68, -3.24, -3.16, -1.68, 1.68, -4.75, -2.89, -0.09, 3.26, -1.56, 1.53, -1.88, 3.59, -2.34, 3.91, -3.52, -3.2, 4.25, -3.69, -2.89, 2.62, 0.66, -0.34, -1.52, -2.76, -4.5, 3.2, 0.5, 3.51, -3.05, -2.25, -4.64, -3.22, -0.7, -4.5, 4.42, 4.06, -1.22, -4.35, 3.59, -3.06, 3.42],
    h::Vector{Float64} = [2.6, 0.44, -3.68, 3.5, -4.0, 2.68, -4.19, 3.93, -0.3, -3.53, -3.64, 2.26, 3.11, 0.08, -4.41, 4.95, -2.42, 4.2, -2.17, 0.32, 2.93, 0.07, 0.79, 3.61, 3.47],
)
    M = length(h)
    Nx = length(x)
    y = zeros(Float64, Nx + M - 1)
    
    for n in 1:Nx
        for m in 1:M
            y[n + m - 1] += x[n] * h[m]
        end
    end

    energia = sum(y .^ 2)
    moc = sum(y.^2) / length(y)
    skuteczna = sqrt(moc)

    return energia
end

rozwiazanie()

