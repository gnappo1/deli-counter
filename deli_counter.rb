# Write your code here.
def line(names)
    if names.count == 0
      puts "The line is currently empty."
    else
      final_sentence = "The line is currently:"
      names.each.with_index(1) {|name, index| final_sentence << " #{index}. #{name}"}
      puts final_sentence
    end
end

def take_a_number(deli_array, name)
    deli_array.push(name)
    puts "Welcome, #{name}. You are number #{deli_array.length} in line."
end

def now_serving(deli_array)
    if deli_array.length > 0
        puts "Currently serving #{deli_array.shift}."
    else
       puts "There is nobody waiting to be served!"
    end
end