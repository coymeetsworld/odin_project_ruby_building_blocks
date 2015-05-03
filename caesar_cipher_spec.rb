require_relative "caesar_cipher"

describe "Caesar Cipher functions" do

	it "encodes 1 letter" do
		expect(caesar_cipher('a',1)).to eq('b')
		expect(caesar_cipher('a',2)).to eq('c')
		expect(caesar_cipher('a',3)).to eq('d')
		expect(caesar_cipher('a',26)).to eq('{')
	end

	it "encodes 1 special char" do
		expect(caesar_cipher('#',1)).to eq('$')
		expect(caesar_cipher('a',1)).to eq('b')
		expect(caesar_cipher('a',1)).to eq('b')

	end

	it "does not encode since the shift is 0" do
		expect(caesar_cipher('a',0)).to eq('a')
		expect(caesar_cipher('#',0)).to eq('#')
		expect(caesar_cipher('0',0)).to eq('0')
	end

	it "encodes 2 letters" do
		expect(caesar_cipher('ab',1)).to eq('bc')
		expect(caesar_cipher('xy',1)).to eq('yz')
		expect(caesar_cipher('bc',2)).to eq('de')
		expect(caesar_cipher('cd',3)).to eq('fg')
	end

	it "encodes 2 numbers" do
		expect(caesar_cipher('00',1)).to eq('11')
		expect(caesar_cipher('15',1)).to eq('26')
		expect(caesar_cipher('99',1)).to eq('::')
	end

	it "doesn't encode any letters or numbers because shift is 0" do
		expect(caesar_cipher('ab',0)).to eq('ab')
		expect(caesar_cipher('xy',0)).to eq('xy')
		expect(caesar_cipher('00',0)).to eq('00')
		expect(caesar_cipher('99',0)).to eq('99')
	end

	it "encodes bigger strings" do
		expect(caesar_cipher('hello',1)).to eq('ifmmp')
		expect(caesar_cipher('45 jump',3)).to eq('78#mxps')
		expect(caesar_cipher('#!#,',5)).to eq('(&(1')
	end
	
end
