# frozen_string_literal: true

class Parser
  class LogEntry
    def from(log_entry_str)
      entry_parts = log_entry_str.split
      {path: entry_parts[0] || "", ip: entry_parts[1] || ""}
    end

    def valid?(log_entry)
      path_present?(log_entry)
    end

    private

    def path_present?(log_entry)
      !log_entry[:path].empty?
    end
  end
end
