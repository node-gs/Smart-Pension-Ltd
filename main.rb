require './parser'

parser = Parser.new(log: ARGV[0])
parser.present_total_views
parser.present_unique_views