#!/usr/bin/ruby

UPPERCASE_A_VALUE = 65
UPPERCASE_Z_VALUE = 90
LOWERCASE_A_VALUE = 97
LOWERCASE_Z_VALUE = 122
LETTERS_IN_ALPHABET = 26

def caesar_cipher msg, shift_num


	for index in 0...msg.length
	
		ascii_value = msg[index].ord


		if ascii_value >= UPPERCASE_A_VALUE && ascii_value <= UPPERCASE_Z_VALUE
			shift_num %= LETTERS_IN_ALPHABET #wrap
			ascii_value += shift_num 
			if ascii_value > UPPERCASE_Z_VALUE
				ascii_value -= LETTERS_IN_ALPHABET
			end
		elsif ascii_value >= LOWERCASE_A_VALUE && ascii_value <= LOWERCASE_Z_VALUE
			shift_num %= LETTERS_IN_ALPHABET #wrap
			ascii_value += shift_num 
			if ascii_value > LOWERCASE_Z_VALUE
				ascii_value -= LETTERS_IN_ALPHABET
			end
		end

		msg[index] = ascii_value.chr
	end

	msg
end
