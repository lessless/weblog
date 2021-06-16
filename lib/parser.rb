# frozen_string_literal: true

# The Parser class is the main entry point and the orchestrating object for log file parsing.
class Parser
  def initialize(reader:, repository:, printer:)
    @reader = reader
    @repo = repository
    @printer = printer
  end

  def run
    reader.stream do |path, ip|
      repo.add_visit(path, ip)
    end
    printer.table(Parser::Visits.new(repo.visits))
    print "\n"
    printer.table(Parser::Views.new(repo.views))
  end

  private

  attr_reader :reader, :repo, :printer
end
