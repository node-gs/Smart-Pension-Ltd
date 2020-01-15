require './parser'
require './presenter'

parser = Parser.new(log: ARGV[0], presenter: Presenter)

[:visits, :unique_visits].each { |visit_type| parser.present_views(by_type: visit_type) }