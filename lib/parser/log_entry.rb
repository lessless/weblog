# frozen_string_literal: true

class Parser
  # The LogEntry class can parsing log file lines into log entries and encapsulates all the associated knowledge.
  class LogEntry
    # :reek:UtilityFunction
    def from(log_entry_str)
      entry_parts = log_entry_str.split
      { path: entry_parts[0] || '', ip: entry_parts[1] || '' }
    end

    def valid?(log_entry)
      path_present?(log_entry) &&
      Parser::IPAddress.valid?(log_entry[:ip])
    end

    private

    # :reek:UtilityFunction
    def path_present?(log_entry)
      !log_entry[:path].empty?
    end
  end
end
