require "byebug"

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

# p char_indices('mississippi')   # => {"m"=>[0], "i"=>[1, 4, 7, 10], "s"=>[2, 3, 5, 6], "p"=>[8, 9]}
# p char_indices('classroom')     # => {"c"=>[0], "l"=>[1], "a"=>[2], "s"=>[3, 4], "r"=>[5], "o"=>[6, 7], "m"=>[8]}

# def longest_streak(str)
#     return str if str.length ==1 
#     count =1
#     streak_char = ""
#     str.each_char.with_index do |char, i|
        
#         if char == str[i+1]
#             count+=1
#             streak_char = char
#         end
#     end
#     longest_streak
# end

# longest_streak('a')           # => 'a'
# longest_streak('accccbbb')    # => 'cccc'
# longest_streak('aaaxyyyyyzz') # => 'yyyyy
# longest_streak('aaabbb')      # => 'bbb'
# longest_streak('abc')         # => 'c'

def bi_prime?(num)
    prime_factors = prime_factors(num)
  
    prime_factors.each do |factor_1|
        prime_factors.each do |factor_2|
            if factor_1 * factor_2 == num
                return true
            end
        end
    end
    false

end

def is_prime?(num)
    if num < 2
        return false
    end
    (2...num).each do |n|
        if num % n == 0
            return false
        end
    end
    true
end

def prime_factors(num)
    prime_factors = []
    (2...num).each do |factor|
        if num % factor ==0 && is_prime?(factor)
            prime_factors << factor
        end
    end
    prime_factors
end


# p bi_prime?(14)   # => true
# p bi_prime?(22)   # => true
# p bi_prime?(25)   # => true
# p bi_prime?(94)   # => true
# p bi_prime?(24)   # => false
# p bi_prime?(64)   # => false

def vigenere_cipher(message, keys)
    alpha = ("a".."z").to_a
    msg = message.split("")
    size = message.length
    key = create_key(keys, size)
    encrypted_message = ""

    msg.each_with_index do |char, i|
        old_idx = alpha.index(char)
        k = key[i]
        new_idx = (old_idx+k) % 26
        new_char = alpha[new_idx]
        encrypted_message += new_char
    end
    encrypted_message 
end 

def create_key(keys, size)
    new_key = []
    while new_key.length < size
        new_key << keys
    end
    new_key.flatten
end

# p vigenere_cipher("toerrishuman", [1])        # => "upfssjtivnbo"
# p vigenere_cipher("toerrishuman", [1, 2])     # => "uqftsktjvobp"
# p vigenere_cipher("toerrishuman", [1, 2, 3])  # => "uqhstltjxncq"
# p vigenere_cipher("zebra", [3, 0])            # => "ceerd"
# p vigenere_cipher("yawn", [5, 1])             # => "dbbo"

def vowel_rotate(str)
    replacements =  find_vowels(str)
    vowels = "aeiou"
    new_word = ""
    str.each_char do |char|
        if !vowels.include?(char)
            new_word += char
        else
            new_word += replacements.shift.to_s
        end
    end
    new_word

end

def find_vowels(str)
    found_vowels = []
    vowels = "aeiou"
    ordered_vowels = []
    str.each_char do |char|
        if vowels.include?(char)
            found_vowels << char
        end
    end
    last_vowel = found_vowels.pop
    ordered_vowels << last_vowel 
    ordered_vowels += found_vowels
    ordered_vowels
end

# p vowel_rotate('computer')      # => "cempotur"
# p vowel_rotate('oranges')       # => "erongas"
# p vowel_rotate('headphones')    # => "heedphanos"
# p vowel_rotate('bootcamp')      # => "baotcomp"
# p vowel_rotate('awesome')       # => "ewasemo"

#  _____   _____    ____    _____   _____              _      _                       
# |  __ \ |  __ \  / __ \  / ____| |  __ \            | |    | |                      
# | |__) || |__) || |  | || |      | |__) |_ __  ___  | |__  | |  ___  _ __ ___   ___ 
# |  ___/ |  _  / | |  | || |      |  ___/| '__|/ _ \ | '_ \ | | / _ \| '_ ` _ \ / __|
# | |     | | \ \ | |__| || |____  | |    | |  | (_) || |_) || ||  __/| | | | | |\__ \
# |_|     |_|  \_\ \____/  \_____| |_|    |_|   \___/ |_.__/ |_| \___||_| |_| |_||___/
                                                                                    
                                                                                    
class String

    def select(&prc)
        new_str = ""
        return new_str if !prc
        self.each_char do |char|
            if prc.call(char)
            
             new_str += char
            
            end
        end
        new_str
    end
# p "app academy".select { |ch| !"aeiou".include?(ch) }   # => "pp cdmy"
# p "HELLOworld".select { |ch| ch == ch.upcase }          # => "HELLO"
# p "HELLOworld".select          # => ""


    def map!(&prc)
        self.each_char.with_index do |char, i|
            self[i] = prc.call(char, i)
        end
        self
    end
    #Examples
#     word_1 = "Lovelace"
# word_1.map! do |ch| 
#     if ch == 'e'
#         '3'
#     elsif ch == 'a'
#         '4'
#     else
#         ch
#     end
# end
# p word_1        # => "Lov3l4c3"

# word_2 = "Dijkstra"
# word_2.map! do |ch, i|
#     if i.even?
#         ch.upcase
#     else
#         ch.downcase
#     end
# end
# p word_2        # => "DiJkStRa"
    

end
                                                                                     

# _______  _______  _______           _______  _______ _________ _______  _         
# (  ____ )(  ____ \(  ____ \|\     /|(  ____ )(  ____ \\__   __/(  ___  )( (    /|  
# | (    )|| (    \/| (    \/| )   ( || (    )|| (    \/   ) (   | (   ) ||  \  ( |  
# | (____)|| (__    | |      | |   | || (____)|| (_____    | |   | |   | ||   \ | |  
# |     __)|  __)   | |      | |   | ||     __)(_____  )   | |   | |   | || (\ \) |  
# | (\ (   | (      | |      | |   | || (\ (         ) |   | |   | |   | || | \   |  
# | ) \ \__| (____/\| (____/\| (___) || ) \ \__/\____) |___) (___| (___) || )  \  |  
# |/   \__/(_______/(_______/(_______)|/   \__/\_______)\_______/(_______)|/    )_)  
                         

def multiply(a, b)
    if b >0 && a>0
       a = a + multiply(a, b-1)
    else 
        return "neg num"

    end
    

end

multiply(3, 5)        # => 15
multiply(5, 3)        # => 15
multiply(2, 4)        # => 8
multiply(0, 10)       # => 0
multiply(-3, -6)      # => 18
multiply(3, -6)       # => -18
multiply(-3, 6)       # => -18