require './parser'

describe Parser do
  it 'can read a file' do
    expect(File).to receive(:read).and_return("line one \n line two")

    described_class.new(log: 'some string').read_file
  end
end