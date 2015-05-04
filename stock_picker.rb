#!/usr/bin/ruby

def stock_picker stock_price_array

	difference = 0
	buy_day_ndx = 0
	sell_day_ndx = 0

	stock_price_array.each_index do |i|
		buy_day = stock_price_array.shift	
		sell_day = stock_price_array.max {|i,j| i <=> j}
		if sell_day - buy_day > difference	
			difference = sell_day - buy_day
			buy_day_ndx = i
			sell_day_ndx = stock_price_array.find_index(sell_day)+1+i
		end	
	end

	[buy_day_ndx, sell_day_ndx]
end
