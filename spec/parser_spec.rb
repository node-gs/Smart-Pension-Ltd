require './parser'
describe Parser do
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

  it 'sends a message to a presenter with formatted data and a type' do
    presenter = double("Presenter")
    processor = double("Processor")
    parser = described_class.new(presenter: presenter, processor: processor)
    allow(processor).to receive(:process_log).and_return(formatted_data_structure)
    
    expect(presenter).to receive(:call).with(formatted_data_structure, :unique_visits)
    expect(presenter).to receive(:call).with(formatted_data_structure, :visits)
    parser.present_views(by_type: :unique_visits)
    parser.present_views(by_type: :visits)
  end

end