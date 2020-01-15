class Parser
  def initialize presenter:, processor:
    @presenter = presenter
    @processor = processor
  end

  def present_views by_type:
    @presenter.call(process_formatted_views, by_type)
  end
private
  def process_formatted_views 
    @processor.process_log
  end
end
 