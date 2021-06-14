require "spec_helper"
require "parser"
require "parser/reader"
require "parser/stats_repository"

describe "Parser" do
  let(:logfile) { "spec/fixtures/minimal.log" }
  let(:reader) { instance_double(Parser::Reader, logfile) }
  let(:repository) { instance_double(Parser::StatsRepository) }
  let(:printer) { instance_double("Parser::ConsolePrinter") }

  subject { Parser.new(reader: reader, repository: repository, printer: printer) }

  it "prints page views table" do
    expect(reader).to receive(:stream).and_yield("/index", "1.1.1.1")
    expect(repository).to receive(:add_visit).with("/index", "1.1.1.1")
    expect(printer).to receive(:table).with({ header: ["Page", "Number of visits"], rows: [["/index", 1]] })
    expect(printer).to receive(:table).with({ header: ["Page", "Number of views"], rows: [["/index", 1]] })

    subject.run()
  end
end
