Presenter = Proc.new do |formatted_views, by_type|
  formatted_views
    .sort_by { |view| view[by_type] }
    .reverse
    .each do |view|
      puts "#{view[:endpoint]} #{view[by_type]} #{by_type.to_s.split("_").join(" ")}"
    end
end
