
module Enumerable
	def my_select
		i = 0
		selected = []
		while i < self.size
			if yield(self[i])
				selected.push(self[i])
			end
			i+=1
		end	
		selected
	end

	def my_all?
		no_exceptions = true
		self.each do |item|
			if !yield(item)	
				no_exceptions = false
				break
			end
		end
		no_exceptions
	end

	def my_any?
		no_exceptions = false
		self.each do |item|
			if yield(item)	
				no_exceptions = true
				break
			end
		end
		no_exceptions
	end

	# if never is true for any objects
	def my_none?
		any_exceptions = false
		self.each do |item|
			if yield(item)	
				any_exceptions = true
				break
			end
		end
		!any_exceptions
	end

	def my_count comparator=nil
		true_counts = 0
		if block_given?
			self.each do |item|
				if yield(item)	
					true_counts +=1
				end
			end
		elsif comparator!=nil
			self.each do |item|
				if item == comparator
					true_counts += 1
				end
			end
		else
			true_counts = self.size
		end
		true_counts
	end

	def my_map
		map_values = []
		self.each do |item|
			map_values.push(yield(item))
		end
		map_values
	end


	def my_each
		i = 0
		while i < self.size
			yield(self[i])
			i+=1
		end
		self
	end
end
