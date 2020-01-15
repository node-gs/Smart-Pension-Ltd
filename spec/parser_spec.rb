require './parser'
describe Parser do
  formatted_views = ["/help_page/1 184.123.665.067", "/help_page/1 184.123.665.067", "/contact 184.123.665.067", "/help_page/1 126.318.035.038"]
  formatted_data_structure = [
    {
      endpoint: "/help_page/1",
      ips: ["184.123.665.067", "184.123.665.067", "126.318.035.038"],
      unique_visits: 2,
      visits: 3
    },
    {
      endpoint: "/contact",
      ips: ["184.123.665.067"],
      unique_visits: 1,
      visits: 1
    }
  ]
  
  it 'can read a file' do
    expect(File).to receive(:read).and_return("line one \n line two")

    described_class.new(log: '').read_file
  end

  it 'can process a file into an appropriate data structure' do
    parser = described_class.new(log: '')
    allow(parser).to receive(:read_file).and_return(formatted_views)

    expect(parser.process_formatted_views).to eq formatted_data_structure 
  end

  it 'can output ordered views by type per endpoint to stdout' do
    parser = described_class.new(log: '')
    allow(parser).to receive(:process_formatted_views).and_return(formatted_data_structure.reverse)

    expect { parser.present_views(by_type: :unique_visits) }.to output("/help_page/1 2 unique visits\n/contact 1 unique visits\n").to_stdout
    expect { parser.present_views(by_type: :visits) }.to output("/help_page/1 3 visits\n/contact 1 visits\n").to_stdout
  end
end