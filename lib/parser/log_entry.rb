# frozen_string_literal: true

class Parser
  # The LogEntry class can parsing log file lines into log entries and encapsulates all the associated knowledge.
  class LogEntry
    # :reek:UtilityFunction
    def from(log_entry_str)
      entry_parts = log_entry_str.split
      { path: normalise_path(entry_parts[0]), ip: normalise_ip(entry_parts[1]) }
    end

    def valid?(log_entry)
      path_present?(log_entry)
    end

    private

    # :reek:UtilityFunction
    def path_present?(log_entry)
      !log_entry[:path].empty?
    end

    # :reek:ControlParameter
    def normalise_path(path_str)
      path_str || ''
    end

    # :reek:ControlParameter
    # :reek:UtilityFunction
    def normalise_ip(ip_str)
      if Parser::IPAddress.valid?(ip_str)
        ip_str
      else
        'Invalid IP'
      end
    end
  end
end
