# frozen_string_literal: true

require 'parser/log_entry'

class Parser
  # The LogFileReader class is responsible for reading local file contents
  class LogFileReader
    def initialize(logfile)
      @logfile = logfile
      @log_entry = Parser::LogEntry.new
    end

    def stream
      File.open(logfile, 'r').each_line do |log_line|
        parsed_entry = @log_entry.from(log_line)
        yield(parsed_entry[:path], parsed_entry[:ip]) if @log_entry.valid?(parsed_entry)
      end
    end

    private

    attr_reader :logfile, :log_entry
  end
end
