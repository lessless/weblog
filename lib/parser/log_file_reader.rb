# frozen_string_literal: true

class Parser
  # The LogFileReader class is responsible for reading local file contents
  class LogFileReader
    def initialize(logfile)
      @logfile = logfile
      @log_entry_parser = Parser::LogEntry.new
    end

    def stream
      File.open(logfile, 'r').each_line do |log_line|
        parsed_entry = log_entry_parser.from(log_line)
        yield(parsed_entry[:path], parsed_entry[:ip]) if log_entry_parser.valid?(parsed_entry)
      end
    end

    private

    attr_reader :logfile, :log_entry_parser
  end
end
