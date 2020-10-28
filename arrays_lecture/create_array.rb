require "benchmark"
#Literal constructor:
literal_array = [1, true, "hello"] #=> [1, true, "hello"]

#Class constructor:
new_array_1 = Array.new #=> []
new_array_2 = Array.new(3)   #=> [nil, nil, nil]
new_array_3 = Array.new(3, "hello") # => ["hello", "hello", "hello"] 
new_array_4 = Array.new(3) {|i| i * i}  #=> [0, 1, 4] 


#Alternative syntaxes:

#version with the method [], from the Array class
Array.[](1, true, "hello") #=> [1, true, "hello"]
Array[1, true, "hello"] #=> [1, true, "hello"]

# version with the Array method from the Kernel
Array(2..4) #=> [2, 3, 4] 


# Let's test the performances of these different ways to create an array

Benchmark.bmbm do |x|
    x.report("[]") { 100.times do [1, 2, 3, 4, 5, 6, 7, 8, 9, 10] end }
    x.report("Array.new")  { 100.times do Array.new(10) {|i| i + 1} end  }
    x.report("Array.[]") { 100.times do Array.[](1, 2, 3, 4, 5, 6, 7, 8, 9, 10) end }
    x.report("Array[]") { 100.times do Array[1, 2, 3, 4, 5, 6, 7, 8, 9, 10] end }
    x.report("Array()") { 100.times do Array([1, 2, 3, 4, 5, 6, 7, 8, 9, 10]) end }
end

puts "------------"
Benchmark.bmbm do |x|
    x.report("[]") { 1000.times do [1, 2, 3, 4, 5, 6, 7, 8, 9, 10] end }
    x.report("Array.new")  { 1000.times do Array.new(10) {|i| i + 1} end  }
    x.report("Array.[]") { 1000.times do Array.[](1, 2, 3, 4, 5, 6, 7, 8, 9, 10) end }
    x.report("Array[]") { 1000.times do Array[1, 2, 3, 4, 5, 6, 7, 8, 9, 10] end }
    x.report("Array()") { 1000.times do Array([1, 2, 3, 4, 5, 6, 7, 8, 9, 10]) end }
end

puts "------------"
Benchmark.bmbm do |x|
    x.report("[]") { 10000.times do [1, 2, 3, 4, 5, 6, 7, 8, 9, 10] end }
    x.report("Array.new")  { 10000.times do Array.new(10) {|i| i + 1} end  }
    x.report("Array.[]") { 10000.times do Array.[](1, 2, 3, 4, 5, 6, 7, 8, 9, 10) end }
    x.report("Array[]") { 10000.times do Array[1, 2, 3, 4, 5, 6, 7, 8, 9, 10] end }
    x.report("Array()") { 10000.times do Array([1, 2, 3, 4, 5, 6, 7, 8, 9, 10]) end }
end