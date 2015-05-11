require_relative "bubble_sort"

def bubble_sort_by array
  begin
    sort_performed = false
    for i in 0...array.length-1
      comp_value = yield(array[i],array[i+1])
			if comp_value < 0
        array[i],array[i+1] = array[i+1],array[i]
        sort_performed =true
      end
    end 
  end until !sort_performed
  return array
end

describe "Bubble Sort" do
	it "sort 2 item number array" do
    expect(bubble_sort([2,1])).to eq([1,2])
    expect(bubble_sort([1,0])).to eq([0,1])
    expect(bubble_sort([0,-1])).to eq([-1,0])
	end

	it "sort already sorted number arrays" do
		expect(bubble_sort([1,2,3,4,5])).to eq([1,2,3,4,5])
		expect(bubble_sort([1,2,4,8,16,32,64,128])).to eq([1,2,4,8,16,32,64,128])
		expect(bubble_sort([-15,-10,-5,0,5,10,15])).to eq([-15,-10,-5,0,5,10,15])
	end

	it "sort 3 item number array" do
    expect(bubble_sort([2,1,3])).to eq([1,2,3])
    expect(bubble_sort([15,-1,6])).to eq([-1,6,15])
    expect(bubble_sort([7,19,4])).to eq([4,7,19])
	end

	it "sort backwards number array" do
    expect(bubble_sort([3,2,1])).to eq([1,2,3])
    expect(bubble_sort([5,4,3,2,1])).to eq([1,2,3,4,5])
    expect(bubble_sort([10,9,8,7,6,5,4,3,2,1])).to eq([1,2,3,4,5,6,7,8,9,10])
    expect(bubble_sort([0,-1,-2,-3,-4,-5])).to eq([-5,-4,-3,-2,-1,0])
	end

	it "sort number array with all same values" do
    expect(bubble_sort([1,1,1])).to eq([1,1,1])
    expect(bubble_sort([0,0,0,0,0])).to eq([0,0,0,0,0])
		expect(bubble_sort([-1,-1,-1,-1,-1])).to eq([-1,-1,-1,-1,-1])
	end

	it "sort example" do
		expect(bubble_sort([4,3,78,2,0,2])).to eq([0,2,2,3,4,78])
	end

	left = ""
	right = ""

	it "sort 2 item string array" do
		arr = bubble_sort_by(["that","hi"]) do |left, right|
			right.length - left.length
		end
		expect(arr).to eq (["hi","that"])
	end

	it "sort already sorted string array" do
		arr = bubble_sort_by(["abc","defghi"]) do |left, right|
			right.length - left.length
		end
		expect(arr).to eq (["abc","defghi"])

		arr = bubble_sort_by(["a","bb","ccc","dddd","eeeee"]) do |left, right|
			right.length - left.length
		end
		expect(arr).to eq (["a","bb","ccc","dddd","eeeee"])
	end

	it "sort backwards string array" do
		arr = bubble_sort_by(["eeeee","dddd","ccc","bb","a"]) do |left, right|
			right.length - left.length
		end
		expect(arr).to eq (["a","bb","ccc","dddd","eeeee"])

		arr = bubble_sort_by(["zebras","xylophone","yak","dragons","alpha"]) do |left, right|
			right.length - left.length
		end
		expect(arr).to eq (["yak","alpha","zebras","dragons","xylophone"])
	end

	it "sort string array with all same values" do
		arr = bubble_sort_by(["a","a","a","a","a"]) do |left, right|
			right.length - left.length
		end
		expect(arr).to eq (["a","a","a","a","a"])

		arr = bubble_sort_by(["whiskey","whiskey","whiskey","whiskey"]) do |left, right|
			right.length - left.length
		end
		expect(arr).to eq (["whiskey","whiskey","whiskey","whiskey"])
	end

	it "sort string array with some same values" do
		arr = bubble_sort_by(["tango","foxtrot","tango","foxtrot"]) do |left, right|
			right.length - left.length
		end
		expect(arr).to eq (["tango","tango","foxtrot","foxtrot"])
	end

	it "sort string example" do
		arr = bubble_sort_by(["hi","hello","hey"]) do |left, right|
			right.length - left.length
		end
		expect(arr).to eq (["hi","hey","hello"])
	end
end
