require_relative "caesar_cipher"

describe "Caesar Cipher functions" do

	it "encodes 1 lowercase letter" do
		expect(caesar_cipher('a',1)).to eq('b')
		expect(caesar_cipher('a',2)).to eq('c')
		expect(caesar_cipher('a',3)).to eq('d')
	end

	it "encodes 1 lowercase letter (wraps from z-a)" do
		expect(caesar_cipher('a',26)).to eq('a')
		expect(caesar_cipher('b',26)).to eq('b')
		expect(caesar_cipher('a',27)).to eq('b')
		expect(caesar_cipher('b',27)).to eq('c')
		expect(caesar_cipher('a',52)).to eq('a')
		expect(caesar_cipher('b',52)).to eq('b')
	end

	it "does not encode spaces" do
		expect(caesar_cipher(' ',1)).to eq(' ')
		expect(caesar_cipher(' ',2)).to eq(' ')
		expect(caesar_cipher(' ',10)).to eq(' ')
		expect(caesar_cipher(' ',26)).to eq(' ')
		expect(caesar_cipher(' ',100)).to eq(' ')
	end

	it "does not encode since the shift is 0" do
		expect(caesar_cipher('x',0)).to eq('x')
		expect(caesar_cipher('y',0)).to eq('y')
		expect(caesar_cipher('z',0)).to eq('z')
	end

	it "encodes 2 lowercase letters" do
		expect(caesar_cipher('ab',1)).to eq('bc')
		expect(caesar_cipher('xy',1)).to eq('yz')
		expect(caesar_cipher('bc',2)).to eq('de')
		expect(caesar_cipher('cd',3)).to eq('fg')
	end

	it "doesn't encode any letters because shift is 0" do
		expect(caesar_cipher('qb',0)).to eq('qb')
		expect(caesar_cipher('te',0)).to eq('te')
		expect(caesar_cipher('rb',0)).to eq('rb')
		expect(caesar_cipher('wr',0)).to eq('wr')
	end

	it "doesn't encode any special characters because shift is 0" do
		expect(caesar_cipher('!',14)).to eq('!')
		expect(caesar_cipher('#',24)).to eq('#')
		expect(caesar_cipher('@',3)).to eq('@')
		expect(caesar_cipher('?',88)).to eq('?')
	end

	it "encodes longer lowercase strings" do
		expect(caesar_cipher('hello',1)).to eq('ifmmp')
		expect(caesar_cipher('wide reciever',3)).to eq('zlgh uhflhyhu')
		expect(caesar_cipher('orange and black',2)).to eq('qtcpig cpf dncem')
	end

	it "encoder with wrapping works on lowercase characters" do
		expect(caesar_cipher('z',1)).to eq('a')
		expect(caesar_cipher('z',2)).to eq('b')
		expect(caesar_cipher('q',10)).to eq('a')
		expect(caesar_cipher('c',30)).to eq('g')
		expect(caesar_cipher('f',52)).to eq('f')
	end

	it "encoder with wrapping works on lowercase strings" do
		expect(caesar_cipher('string',10)).to eq('cdbsxq')
		expect(caesar_cipher('xylophone',5)).to eq('cdqtumtsj')
		expect(caesar_cipher('quimby',13)).to eq('dhvzol')
	end

	it "encodes 1 uppercase character" do
		expect(caesar_cipher('A',5)).to eq('F')
		expect(caesar_cipher('I',10)).to eq('S')
		expect(caesar_cipher('B',20)).to eq('V')
	end

	it "encodes uppercase strings" do
		expect(caesar_cipher('ABC',10)).to eq('KLM')
		expect(caesar_cipher('SP',2)).to eq('UR')
		expect(caesar_cipher('LF',7)).to eq('SM')
		expect(caesar_cipher('FORWARD',1)).to eq('GPSXBSE')
	end

	it "encodes uppercase strings with non-letters" do
		expect(caesar_cipher('1B',5)).to eq('1G')
		expect(caesar_cipher('2B',7)).to eq('2I')
		expect(caesar_cipher('3B',9)).to eq('3K')
		expect(caesar_cipher('L33T',3)).to eq('O33W')
	end

	it "encoder with wrapping works on uppercase characters" do
		expect(caesar_cipher('Z',1)).to eq('A')
		expect(caesar_cipher('A',26)).to eq('A')
		expect(caesar_cipher('A',52)).to eq('A')
		expect(caesar_cipher('O',15)).to eq('D')
		expect(caesar_cipher('F',30)).to eq('J')
	end

	it "encoder with wrapping works on uppercase strings" do
		expect(caesar_cipher('XYZ',5)).to eq('CDE')
		expect(caesar_cipher('JUNK',30)).to eq('NYRO')
		expect(caesar_cipher('SPEEDY',10)).to eq('CZOONI')
	end

	it "encoder works on mixed string" do
		expect(caesar_cipher('Hello',3)).to eq('Khoor')
		expect(caesar_cipher('Quarterback',10)).to eq('Aekbdoblkmu')
	end

	it "encodes a mixed sentence" do
		expect(caesar_cipher('Hello World!',1)).to eq('Ifmmp Xpsme!')
		expect(caesar_cipher('Goodnight Moon!',3)).to eq('Jrrgqljkw Prrq!')
	end

	it "encodes example string from theodinproject website" do
		expect(caesar_cipher("What a string!",5)).to eq("Bmfy f xywnsl!")
	end

end
