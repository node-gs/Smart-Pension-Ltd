class Parser
  def initialize log:
    @log = log
  end

  def read_file
    File.read(@log).split("\n")
  end

end