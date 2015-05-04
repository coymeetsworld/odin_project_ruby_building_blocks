#!/usr/bin/ruby

def substrings word, dictionary

	frequency = Hash.new(0)
	for i in 0..word.length
		for j in i...word.length
			if dictionary.find{ |dict_word| dict_word == word[i..j].downcase }
				frequency[word[i..j].downcase] += 1	
			end	
		end
	end

	frequency
end
