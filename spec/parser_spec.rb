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

  it 'sends a message to a presenter with formatted data' do
    presenter = double("Presenter")
    parser = described_class.new(log: '', presenter: presenter)
    allow(parser).to receive(:read_file).and_return(formatted_views)
    
    expect(presenter).to receive(:call).with(formatted_data_structure, :unique_visits)
    parser.present_views(by_type: :unique_visits)
  end

end