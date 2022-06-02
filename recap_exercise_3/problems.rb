def no_dupes?(arr)
    uniques = []
    dupes = []

    arr.each do |ele|
        if !uniques.include?(ele)
            uniques << ele
        else
            dupes << ele
        end
    end
    uniques - dupes
end

# p no_dupes?([1, 1, 2, 1, 3, 2, 4])         # => [3, 4]
# p no_dupes?(['x', 'x', 'y', 'z', 'z'])     # => ['y']
# p no_dupes?([true, true, true])            # => []


def no_consecutive_repeats?(arr)
    last = arr.length-1
    (0...last).each do |idx|
        if arr[idx] == arr[idx+1]
            return false
        end
    end
    return true
end

# p no_consecutive_repeats?(['cat', 'dog', 'mouse', 'dog'])     # => true
# p no_consecutive_repeats?(['cat', 'dog', 'dog', 'mouse'])     # => false
# p no_consecutive_repeats?([10, 42, 3, 7, 10, 3])              # => true
# p no_consecutive_repeats?([10, 42, 3, 3, 10, 3])              # => false
# p no_consecutive_repeats?(['x'])                              # => true

def char_indices(str)
    arr = str.split("")
    hash = Hash.new{|h,k| h[k] =[]}
    arr.each_with_index do |ele, i|
        hash[ele] << i
    end
    hash
end

p char_indices('mississippi')   # => {"m"=>[0], "i"=>[1, 4, 7, 10], "s"=>[2, 3, 5, 6], "p"=>[8, 9]}
p char_indices('classroom')     # => {"c"=>[0], "l"=>[1], "a"=>[2], "s"=>[3, 4], "r"=>[5], "o"=>[6, 7], "m"=>[8]}

def longest_streak(str)
    return str if str.length ==1 
    count =1
    streak_char = ""
    str.each_char.with_index do |char, i|
        
        if char == str[i+1]
            count+=1
            streak_char = char
        end

    longest_streak
end

longest_streak('a')           # => 'a'
longest_streak('accccbbb')    # => 'cccc'
longest_streak('aaaxyyyyyzz') # => 'yyyyy
longest_streak('aaabbb')      # => 'bbb'
longest_streak('abc')         # => 'c'

def bi_prime?(num)

end

def vigenere_cipher()