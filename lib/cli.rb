require 'optparse'

class CLI
  Options = Struct.new(:file)

  def self.parse(options)
    args = Options.new()

    opt_parser =  OptionParser.new do |opts|
      opts.banner = "Usage: bin/parser [options]"

      opts.on("-f", "--file FILE", "Path to log FILE ") do |file|
        args.file = file
      end

      opts.on("-h", "--help", "Prints this help") do
        puts opts
        exit
      end
    end

    opt_parser.parse!(options)
    args
  end
end
