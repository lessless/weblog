# frozen_string_literal: true

# The Parser class is the main entry point and the orchestrating object for log file parsing.
class Parser
  def initialize(reader:, repository:, printer:)
    @reader = reader
    @repo = repository
    @printer = printer
    @log_entry = Parser::LogEntry.new
  end

  def run
    views = Parser::Views.new
    reader.stream do |log_line|
      parsed_entry = @log_entry.from(log_line)
      repo.add_visit(parsed_entry[:path], parsed_entry[:ip]) if @log_entry.valid?(parsed_entry)
    end
    printer.table(Parser::Visits.new(repo.visits))
    print "\n"
    printer.table(Parser::Views.new(repo.stats))
  end

  private

  attr_reader :reader, :repo, :printer, :formatter
end
