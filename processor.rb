class Processor
  def initialize log:
    @log = log
  end

  def process_log 
    formatted_views = read_file.map do |view|
      current_endpoint = view.split.first
      calculated_ips = calculate_ips current_endpoint 
      {
        endpoint: current_endpoint,
        ips: calculated_ips,
        visits: calculated_ips.size,
        unique_visits: calculated_ips.uniq.size
      }
    end
    formatted_views.uniq { |view| view[:endpoint] } 
  end
private
  def read_file 
    File.read(@log).split("\n")
  end

  def calculate_ips current_endpoint
    read_file
      .map { |view| view.split[1] if current_endpoint == view.split.first }
      .compact
  end
end
