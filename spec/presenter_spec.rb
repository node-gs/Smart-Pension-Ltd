require './presenter'

describe Presenter do
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

  it 'can output ordered views by type per endpoint to stdout' do
    expect { described_class.call(formatted_data_structure.reverse, :unique_visits) }.to output("/help_page/1 2 unique visits\n/contact 1 unique visits\n").to_stdout
    expect { described_class.call(formatted_data_structure.reverse, :visits) }.to output("/help_page/1 3 visits\n/contact 1 visits\n").to_stdout
  end
end