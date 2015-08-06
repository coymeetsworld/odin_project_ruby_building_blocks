require_relative "enumerable"

# Taken from https://github.com/thomasjnoe/ruby-project-2/blob/master/spec/my_enumerable_spec.rb
describe "Enumerable Tests" do

	describe "#my_select" do
		context "with empty array" do
			it "returns an empty array" do
				array = [].my_select { |x| x == 1 }
				expect(array).to eql []
			end
		end

		context "with an array of integers" do
			let (:array) { [1,-2,3,4,5,-6] }

			it "returns even numbers only" do
				expect(array.my_select { |x| x.even? } ).to eql [-2,4,-6]
			end

			it "returns odd numbers only" do
				expect(array.my_select { |x| x.odd?} ).to eql [1,3,5]
			end

			it "returns multiples of 3" do
				expect(array.my_select { |x| x % 3 == 0 } ).to eql [3,-6]
			end

			it "returns non-negative integers" do
				expect(array.my_select { |x| x > 0} ).to eql [1,3,4,5]
			end
		end

		context "with an array of strings" do
			let (:array) { ["lol","hello","goodbye","lonely hearts club band","hey"] }

			it "returns array of strings containing 'lo' " do
				expect(array.my_select { |x| x.include? "lo" } ).to eql ["lol", "hello", "lonely hearts club band"]
			end

			it "returns array of strings of length 3" do
				expect(array.my_select { |x| x.length == 3 } ).to eql ["lol", "hey"]
			end
		end

		context "with a mixed array" do
			let (:array) { ["lol","hello",4,100,{ :word => "bird", :number => 8 },"hey"] }

			it "returns all strings" do
				expect(array.my_select { |x| x.class == String } ).to eql ["lol", "hello", "hey"]
			end

			it "returns all fixnums" do
				expect(array.my_select { |x| x.class == Fixnum } ).to eql [4, 100]
			end

			it "returns all hashes" do
				expect(array.my_select { |x| x.class == Hash } ).to eql [{ :word => "bird", :number => 8 }]
			end
		end

		context "with a string" do
			it "raises NoMethodError" do
				string = "Hello World!"
				expect { string.my_select { |x| x == "!" } }.to raise_exception NoMethodError
			end
		end

		context "with an integer" do
			it "raises NoMethodError" do
				int = 5
				expect { int.my_select { |x| x == 5 } }.to raise_exception NoMethodError
			end
		end
	end


	describe "#my_all?" do
		context "with empty array" do
			it "returns an empty array" do
				array = [].my_all? { |x| x == 1 }
				expect(array).to eql true
			end
		end

		context "with an array of integers under 10" do
			let (:array) { [1,-2,3,4,5,-6] }

			it "returns true for x < 10" do
				expect(array.my_all? { |x| x < 10 } ).to eql true
			end

			it "returns false for x > 10" do
				expect(array.my_all? { |x| x > 10 } ).to eql false
			end
		end

		context "with an array of strings" do
			let (:array) { ["lol","hello","goodbye","lonely hearts club band"] }

			it "returns true for array including words containing the letter 'o' " do
				expect(array.my_all? { |x| x.include? "o" } ).to eql true
			end

			it "returns true for word lengths greater than or equal to 3" do
				expect(array.my_all? { |x| x.length >= 3 } ).to eql true
			end

			it "returns false for word lengths less than 3" do
				expect(array.my_all? { |x| x.length < 3 } ).to eql false
			end
		end

		context "with a mixed array" do
			let (:array) { ["lol","hello",4,100,{ :word => "bird", :number => 8 },"hey"] }

			it "returns false for all strings" do
				expect(array.my_all? { |x| x.class == String } ).to eql false
			end

			it "returns false for all fixnums" do
				expect(array.my_all? { |x| x.class == Fixnum } ).to eql false
			end

			it "returns false for all hashes" do
				expect(array.my_all? { |x| x.class == Hash } ).to eql false
			end
		end

		context "with a string" do
			it "raises NoMethodError" do
				string = "Hello World!"
				expect { string.my_all? { |x| x == "!" } }.to raise_exception NoMethodError
			end
		end

		context "with an integer" do
			it "raises NoMethodError" do
				int = 5
				expect { int.my_all? { |x| x == 5 } }.to raise_exception NoMethodError
			end
		end
	end


	describe "#my_any?" do
		context "with empty array" do
			it "returns an empty array" do
				array = [].my_any? { |x| x == 1 }
				expect(array).to eql false
			end
		end

		context "with an array of integers under 10" do
			let (:array) { [1,-2,3,4,5,-6] }

			it "returns true for x < 10" do
				expect(array.my_any? { |x| x < 10 } ).to eql true
			end

			it "returns false for x > 10" do
				expect(array.my_any? { |x| x > 10 } ).to eql false
			end
		end

		context "with an array of strings" do
			let (:array) { ["lol","hello","goodbye","lonely hearts club band"] }

			it "returns true for array including words containing 'lo' " do
				expect(array.my_any? { |x| x.include? "lo" } ).to eql true
			end

			it "returns true for word lengths equal to 3" do
				expect(array.my_any? { |x| x.length == 3 } ).to eql true
			end

			it "returns false for word lengths less than 3" do
				expect(array.my_any? { |x| x.length < 3 } ).to eql false
			end
		end

		context "with a mixed array" do
			let (:array) { ["lol","hello",4,100,{ :word => "bird", :number => 8 },"hey"] }

			it "returns true for any strings" do
				expect(array.my_any? { |x| x.class == String } ).to eql true
			end

			it "returns true for any fixnums" do
				expect(array.my_any? { |x| x.class == Fixnum } ).to eql true
			end

			it "returns true for any hashes" do
				expect(array.my_any? { |x| x.class == Hash } ).to eql true
			end

			it "returns false for any floats" do
				expect(array.my_any? { |x| x.class == Float } ).to eql false
			end
		end

		context "with a string" do
			it "raises NoMethodError" do
				string = "Hello World!"
				expect { string.my_any? { |x| x == "!" } }.to raise_exception NoMethodError
			end
		end

		context "with an integer" do
			it "raises NoMethodError" do
				int = 5
				expect { int.my_any? { |x| x == 5 } }.to raise_exception NoMethodError
			end
		end
	end


	describe "#my_none?" do
		context "with empty array" do
			it "returns an empty array" do
				array = [].my_none? { |x| x == 1 }
				expect(array).to eql true
			end
		end

		context "with an array of integers under 10" do
			let (:array) { [1,-2,3,4,5,-6] }

			it "returns true for x < 10" do
				expect(array.my_none? { |x| x < 10 } ).to eql false
			end

			it "returns false for x > 10" do
				expect(array.my_none? { |x| x > 10 } ).to eql true
			end
		end

		context "with an array of strings" do
			let (:array) { ["lol","hello","goodbye","lonely hearts club band"] }

			it "returns true for array including words containing 'lo' " do
				expect(array.my_none? { |x| x.include? "lo" } ).to eql false
			end

			it "returns true for array including words containing 'z' " do
				expect(array.my_none? { |x| x.include? "z" } ).to eql true
			end

			it "returns true for word lengths equal to 3" do
				expect(array.my_none? { |x| x.length == 3 } ).to eql false
			end

			it "returns false for word lengths equal to 4" do
				expect(array.my_none? { |x| x.length == 4 } ).to eql true
			end
		end

		context "with a mixed array" do
			let (:array) { ["lol","hello",4,100,{ :word => "bird", :number => 8 },"hey"] }

			it "returns true for any strings" do
				expect(array.my_none? { |x| x.class == String } ).to eql false
			end

			it "returns true for any fixnums" do
				expect(array.my_none? { |x| x.class == Fixnum } ).to eql false
			end

			it "returns true for any hashes" do
				expect(array.my_none? { |x| x.class == Hash } ).to eql false
			end

			it "returns false for any floats" do
				expect(array.my_none? { |x| x.class == Float } ).to eql true
			end
		end

		context "with a string" do
			it "raises NoMethodError" do
				string = "Hello World!"
				expect { string.my_none? { |x| x == "!" } }.to raise_exception NoMethodError
			end
		end

		context "with an integer" do
			it "raises NoMethodError" do
				int = 5
				expect { int.my_none? { |x| x == 5 } }.to raise_exception NoMethodError
			end
		end
	end


	describe "#my_count" do
		context "with empty array" do
			it "returns 0" do
				array = []
				expect(array.my_count).to eql 0
			end
		end

		context "with an array of integers" do
			let (:array) { [1,-2,3,4,5,-6] }

			it "returns 6 without an argumentor block" do
				expect(array.my_count).to eql 6
			end

			it "returns 1 for argument of 3" do
				expect(array.my_count(3)).to eql 1
			end

			it "returns 0 for argument of 100" do
				expect(array.my_count(100)).to eql 0
			end

			it "returns 2 for x < 0" do
				expect(array.my_count { |x| x < 0 } ).to eql 2
			end

			it "returns 4 for x > 0" do
				expect(array.my_count { |x| x > 0 } ).to eql 4
			end

			it "returns 0 for x > 10" do
				expect(array.my_count { |x| x > 10 } ).to eql 0
			end
		end

		context "with an array of strings" do
			let (:array) { ["lol","hello","goodbye","lonely hearts club band"] }

			it "returns 4 without an argument or block" do
				expect(array.my_count).to eql 4
			end

			it "returns 1 with an argument of 'lol'" do
				expect(array.my_count('lol')).to eql 1
			end

			it "returns 0 with an argument of 'hey'" do
				expect(array.my_count('hey')).to eql 0
			end

			it "returns 3 for array including words containing 'lo' " do
				expect(array.my_count { |x| x.include? "lo" } ).to eql 3
			end

			it "returns 0 for array including words containing 'z' " do
				expect(array.my_count { |x| x.include? "z" } ).to eql 0
			end

			it "returns 1 for word lengths equal to 3" do
				expect(array.my_count { |x| x.length == 3 } ).to eql 1
			end

			it "returns 0 for word lengths equal to 4" do
				expect(array.my_count { |x| x.length == 4 } ).to eql 0
			end
		end

		context "with a mixed array" do
			let (:array) { ["lol","hello",4,100,{ :word => "bird", :number => 8 },"hey"] }

			it "returns 6 without an argument or block" do
				expect(array.my_count).to eql 6
			end

			it "returns 3 for class of strings" do
				expect(array.my_count { |x| x.class == String } ).to eql 3
			end

			it "returns 2 for class of fixnums" do
				expect(array.my_count { |x| x.class == Fixnum } ).to eql 2
			end

			it "returns 1 for class of hash" do
				expect(array.my_count { |x| x.class == Hash } ).to eql 1
			end

			it "returns 0 for class of array" do
				expect(array.my_count { |x| x.class == Array} ).to eql 0
			end
		end

		context "with a string" do
			it "raises NoMethodError" do
				string = "Hello World!"
				expect { string.my_count }.to raise_exception NoMethodError
			end
		end

		context "with an integer" do
			it "raises NoMethodError" do
				int = 5
				expect { int.my_count }.to raise_exception NoMethodError
			end
		end
	end


	describe "#my_map" do
		context "with empty array" do
			it "returns an empty array" do
				array = [].my_map { |x| x + 1 }
				expect(array).to eql []
			end
		end

		context "with an array of integers" do
			let (:array) { [1,2,3,4,5,6] }

			it "returns multiples of 5 for x * 5" do
				expect(array.my_map { |x| x * 5 } ).to eql [5,10,15,20,25,30]
			end

			it "returns integers plus 10 for x + 10" do
				expect(array.my_map { |x| x + 10 } ).to eql [11,12,13,14,15,16]
			end
		end

		context "with an array of strings" do
			let (:array) { ["lol","hello","goodbye","lonely hearts club band"] }

			it "returns 'hey ' followed by the string" do
				expect(array.my_map { |x| 'hey ' + x } ).to eql ['hey lol','hey hello','hey goodbye', 'hey lonely hearts club band']
			end

			it "returns the string twice for string times 2 " do
				expect(array.my_map { |x| x * 2 } ).to eql ['lollol','hellohello','goodbyegoodbye','lonely hearts club bandlonely hearts club band']
			end
		end

		context "with a string" do
			it "raises NoMethodError" do
				string = "Hello World!"
				expect { string.my_none? { |x| x == "!" } }.to raise_exception NoMethodError
			end
		end

		context "with an integer" do
			it "raises NoMethodError" do
				int = 5
				expect { int.my_none? { |x| x == 5 } }.to raise_exception NoMethodError
			end
		end
	end

end
