require_relative "stock_picker"

describe "Stock Picker functions" do

	it "simple test" do
		expect(stock_picker([1,2,3])).to eq([0,2])
	end

	it "two day lists" do
		expect(stock_picker([1,5])).to eq([0,1])
		expect(stock_picker([1,10])).to eq([0,1])
	end

	#it "breaking even" do
	#	expect(stock_picker([10,10])).to eq([0,1])
	#	expect(stock_picker([1,1])).to eq([0,1])
	#end

	#it "losing the minimum with one option" do
	#	expect(stock_picker([2,1])).to eq([0,1])
	#	expect(stock_picker([10,5])).to eq([0,1])
	#end	

	#it "losing the minimum with multiple options" do
	#	expect(stock_picker([10,5,1])).to eq([1,2])
	#	expect(stock_picker([20,18,14,13,1])).to eq([2,3])
	#	expect(stock_picker([569,560,550,300,280,250,200,130,15])).to eq([3,4])
	#end	

	it "continually rising" do
		expect(stock_picker([1,2,4,8,16,32,64])).to eq([0,6])
		expect(stock_picker([1,100,120,121,123,150,160])).to eq([0,6])
		expect(stock_picker([99,100,120,121,123,150,160])).to eq([0,6])
	end

	it "patiently waiting" do	
		expect(stock_picker([1,100,50,200,100,150,80,90])).to eq([0,3])
		expect(stock_picker([80,100,50,200,100,150,400,20])).to eq([2,6])
		expect(stock_picker([100,1000,50,20,3,40,90,400,650,1250,1000,50,850])).to eq([4,9])
	end

end
