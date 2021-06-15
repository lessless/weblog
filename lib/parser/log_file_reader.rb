# frozen_string_literal: true

class Parser
  # The Reader class is responsible for reading local file contents
  class LogFileReader
    def initialize(logfile)
      @logfile = logfile
    end

    def stream
      File.open(logfile, 'r').each_line do |log_entry|
        entry_parts = log_entry.split
        next if empty_line?(entry_parts)

        yield(entry_parts[0], entry_parts[1])
      end
    end

    private

    attr_reader :logfile

    def empty_line?(entry_parts)
      entry_parts.all?(&:nil?)
    end
  end
end
