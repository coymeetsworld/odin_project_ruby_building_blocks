#!/usr/bin/ruby

def bubble_sort array
	begin
		sort_performed = false
		for i in 0...array.length-1
			if array[i] > array[i+1]
				array[i],array[i+1] = array[i+1],array[i]	
				sort_performed = true
			end
		end
	end until !sort_performed
	return array
end
