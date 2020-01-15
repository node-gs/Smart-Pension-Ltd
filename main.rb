require './parser'
require './presenter'
require './processor'

parser = Parser.new(presenter: Presenter, processor: Processor.new(log: ARGV[0]))

[:visits, :unique_visits].each { |visit_type| parser.present_views(by_type: visit_type) }