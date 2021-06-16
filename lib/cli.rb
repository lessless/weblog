# frozen_string_literal: true

require 'optparse'

# This class is responsible for parsing command line arguments and printing help banner
class CLI
  # Holds command line options
  Options = Struct.new(:file)

  # rubocop:disable Metrics/MethodLength
  # :reek:NestedIterators
  # :reek:TooManyStatements
  def self.parse(options)
    args = Options.new
    opt_parser =  OptionParser.new do |opts|
      opts.banner = 'Usage: bin/parser [options]'

      opts.on('-f', '--file FILE', 'Path to log FILE ') do |file|
        args.file = file
      end

      opts.on('-h', '--help', 'Prints this help') do
        puts opts
        exit
      end
    end

    opt_parser.parse!(options)
    args
  end
  # rubocop:enable Metrics/MethodLength
end
