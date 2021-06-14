# The Parser class is the main entry point and the orchestrating object for log file parsing.
class Parser
  def initialize(reader:, repository:, printer:)
    @reader = reader
    @repo = repository
  end

  def run
    reader.stream { |path, ip| repo.add_visit(path, ip) }
  end

  private

  attr_reader :reader
  attr_reader :repo
end
