# frozen_string_literal: true

class Parser
  # The LogFileReader class is responsible for reading local file contents
  class LogFileReader
    def initialize(logfile)
      @logfile = logfile
    end

    def stream
      File.open(logfile, 'r').each_line do |log_line|
        log_line = log_line.chop
        yield(log_line) unless log_line.empty?
      end
    end

    private

    attr_reader :logfile
  end
end
