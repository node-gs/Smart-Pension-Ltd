class Parser
  def initialize log:, presenter:
    @log = log
    @presenter = presenter
  end

  def present_views by_type:
    @presenter.call(process_formatted_views, by_type)
  end

private
  def read_file 
    File.read(@log).split("\n")
  end

  def process_formatted_views 
    formatted_views = read_file.map do |view|
      current_endpoint = view.split.first
      {
        endpoint: current_endpoint,
        ips: calculate_ips(current_endpoint),
        visits: calculate_ips(current_endpoint).size,
        unique_visits: calculate_ips(current_endpoint).uniq.size
      }
    end
    formatted_views.uniq { |view| view[:endpoint]} 
  end
  
  def calculate_ips current_endpoint
    read_file
      .map { |view| view.split[1] if current_endpoint == view.split.first }
      .compact
  end
end
 