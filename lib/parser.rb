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
