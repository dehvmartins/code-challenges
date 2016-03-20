n = gets.strip.to_i
@alphabet = ('A'..'Z').to_a.join

def caesar_cipher(cipher_alphabet, strings )
  print strings.map{|string| string.tr cipher_alphabet, @alphabet}.join(" ")
end

def cipher_alphabet(cipher_word)
    reference = @alphabet.delete(cipher_word)
    reference = reference.split(//).each_slice(cipher_word.size).to_a
    cipher_word = cipher_word.split(//)
    cipher_alphabet = cipher_word.each_with_index.map{|c,index| reference.collect{ |r| r[index]}.unshift(c)}
    cipher_alphabet.sort_by{|p| p[0]}.flatten.compact.join
end

def remove_repeated_letters(word)
  word.split(//).uniq.join
end

1.upto(n) do
    word = remove_repeated_letters(gets.strip)
    original_text = gets.strip.split(" ")
    cipher_alphabet = cipher_alphabet(word)
    puts caesar_cipher(cipher_alphabet,original_text)
end
