# Ruby Programming
# Project: Caesar Cipher

def caesar_cipher(input_string, cipher_offset)
  # This method will perform a Caesar cipher when provided a string and number to offset.
  # Only alpha characters will be ciphered.
  # Uppercase and lowercase characters will maintain their original case.
  # Spaces, special characters, and numbers will maintain their original value.

  # Input   (input_string):  input_string = 'a !' 
  # Input   (cipher_offset): cipher_offset = 3
  # Output  (cipher_string): cipher_string = 'd !'

  alphabet = ['a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j', 'k', 'l', 'm', 'n', 'o', 'p', 'q', 'r', 's', 't', 'u', 'v', 'w', 'x', 'y', 'z']
  cipher_string = ''

  input_string.each_char do |char|  # Check each character in the string to see if it's lowercase value is in the alphabet array.
  
    if alphabet.include?(char.downcase) == true
      # If the character is in the array it calculates the index in the alphabet and adds the offset.
      alphabet_index = alphabet.index(char.downcase)
      cipher_index = alphabet_index + cipher_offset

      # It then checks if it needs to wrap around back to the beginning.
      z_wrap = false
      z_wrap = true unless cipher_index <= (alphabet.length - 1)

      # It then assigns the character a new index and assigns the ciphered value at that index.
      cipher_index = (cipher_index % alphabet.length) if z_wrap == true
      cipher_char = alphabet[cipher_index]

      # The original character (char) is checked for case (uppercase or lowercase).
      char_case = 'lower'
      char_case = 'upper' unless char == char.downcase

      # The ciphered value is added to the output string (cipher_string) in uppercase or lowercase depending on the original character case.
      cipher_string += cipher_char if char_case == 'lower'
      cipher_string += cipher_char.upcase if char_case == 'upper'

    
    else
      cipher_string += char # If the character is not in the array (alphabet) then the character is just added to the output string (cipher_string).
    end 
  end # This will repeat until all characters in the string have been added to the output string (cipher_string)
  return cipher_string
end


puts "What string would you like to cipher using the Caesar Cipher?: "
input_string = gets.chomp
cipher_offset = ''

loop do
  puts "Cipher strength (enter a number from 0 to 26): "
  cipher_offset = gets.chomp.to_i
  if cipher_offset.integer? && cipher_offset >= 0 && cipher_offset <= 26
    break
  end
  puts "Invalid entry, try again."
end

puts caesar_cipher(input_string, cipher_offset)