#!/usr/bin/ruby

def caesar_cipher msg, shift_num

	for index in 0...msg.length
		ascii_value = msg[index].ord
		msg[index] = (ascii_value + shift_num).chr
	end
	msg
end
