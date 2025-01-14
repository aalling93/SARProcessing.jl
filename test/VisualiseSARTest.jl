
include("../src/separateLater/VisualiseSAR/VisualiseSAR.jl")
import .VisualiseSAR
using Images




function sar2grayimage_test(T::Type,size_to_test) 
## Arrange
data = rand(T,size_to_test) .- 4
## Act
img = VisualiseSAR.sar2grayimage(data)

## Assert
testOk = (size(img) == size_to_test) && (eltype(img) <: Gray)

## Debug
if !testOk
    println("Debug info: ", string(StackTraces.stacktrace()[1].func))
    println("size(img): ", size(img))
    println("img: ", img)
end

return testOk
end


@testset "VisualiseSARTest.jl" begin
    @test sar2grayimage_test(Complex{Float64},(9,5))
    @test sar2grayimage_test(Float64,(9,8))  
end