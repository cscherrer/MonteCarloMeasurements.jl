struct LogWeights{T,N} <: AbstractParticles{T,N}
    particles::Vector{T}
    next # :: Particles -> (LogWeights, Particles)
end

struct WeightedParticles{T,N} <: AbstractParticles{T,N}
    particles::Vector{T}
    logweights::Ref{LogWeights{W,N} where W <: Real}
end

const MvWParticles = Vector{<:WeightedParticles}

function WeightedParticles{T,N}(v::AbstractVector) where {T,N}
    logweights = LogWeights(zeros(T, N))
    WeightedParticles{T,N}(v,Ref(logweights))
end
