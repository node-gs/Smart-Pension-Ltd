class Parser
  def initialize log:
    @log = log
  end

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

  def present_views by_type:
    process_formatted_views
      .sort_by { |view| view[by_type] }
      .reverse
      .each do |view|
        puts "#{view[:endpoint]} #{view[by_type]} #{by_type.to_s.split("_").join(" ")}"
      end
  end
private
  def calculate_ips current_endpoint
    read_file
      .map { |view| view.split[1] if current_endpoint == view.split.first }
      .compact
  end
end
 