require_relative "bubble_sort"

describe "Bubble Sort" do

	it "2 item array" do
    expect(bubble_sort([2,1])).to eq([1,2])
    expect(bubble_sort([1,0])).to eq([0,1])
    expect(bubble_sort([0,-1])).to eq([-1,0])
	end

	it "Sorted arrays" do
		expect(bubble_sort([1,2,3,4,5])).to eq([1,2,3,4,5])
		expect(bubble_sort([1,2,4,8,16,32,64,128])).to eq([1,2,4,8,16,32,64,128])
		expect(bubble_sort([-15,-10,-5,0,5,10,15])).to eq([-15,-10,-5,0,5,10,15])
	end

	it "3 item array" do
    expect(bubble_sort([2,1,3])).to eq([1,2,3])
    expect(bubble_sort([15,-1,6])).to eq([-1,6,15])
    expect(bubble_sort([7,19,4])).to eq([4,7,19])
	end

	it "backwards array" do
    expect(bubble_sort([3,2,1])).to eq([1,2,3])
    expect(bubble_sort([5,4,3,2,1])).to eq([1,2,3,4,5])
    expect(bubble_sort([10,9,8,7,6,5,4,3,2,1])).to eq([1,2,3,4,5,6,7,8,9,10])
    expect(bubble_sort([0,-1,-2,-3,-4,-5])).to eq([-5,-4,-3,-2,-1,0])
	end

	it "array with all same values" do
    expect(bubble_sort([1,1,1])).to eq([1,1,1])
    expect(bubble_sort([0,0,0,0,0])).to eq([0,0,0,0,0])
		expect(bubble_sort([-1,-1,-1,-1,-1])).to eq([-1,-1,-1,-1,-1])
	end

	it "example" do
		expect(bubble_sort([4,3,78,2,0,2])).to eq([0,2,2,3,4,78])
	end
end
