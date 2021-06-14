require 'spec_helper'
require 'parser'

describe "Parser" do
  let(:logfile) { 'a_logfile' }
  let(:reader) { instance_double("Parser::Reader") }
  let(:repository) { instance_double("Parser::StatsRepository") }
  let(:printer) { instance_double("Parser::ConsolePrinter") }

  subject { Parser.new(logfile) }

  it "prints page views table" do
    expect(reader).to receive(:stream_from).with(repository)
    expect(repository).to receive(:add_visit).with("/index", "1.1.1.1")
    expect(printer).to receive(:table).with({header: ["Page", "Number of visits"], rows: [["/index", 1]]})
    expect(printer).to receive(:table).with({header: ["Page", "Number of views"], rows: [["/index", 1]]})

    subject.run()
  end
end
