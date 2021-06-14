class Parser
  class Reader
    def initialize(logfile)
      @logfile = logfile
    end

    def stream()
      File.open(logfile, "r").each_line do |log_entry|
        entry_parts = log_entry.split()
        yield(entry_parts[0], entry_parts[1])
      end
    end

    private
    attr_reader :logfile
  end
end
