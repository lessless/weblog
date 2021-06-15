# frozen_string_literal: true

require 'spec_helper'
require 'parser'
require 'parser/log_file_reader'
require 'parser/stats_repository'
require 'parser/visits'
require 'parser/views'

describe 'Parser' do
  let(:logfile) { 'spec/fixtures/minimal.log' }
  let(:reader) { instance_double(Parser::LogFileReader, logfile) }
  let(:repository) { instance_double(Parser::StatsRepository) }
  let(:printer) { instance_double('Parser::ConsolePrinter') }

  subject { Parser.new(reader: reader, repository: repository, printer: printer) }

  it 'prints page views table' do
    visits = Parser::Visits.new({path: '/home', ips: ['1.1.1.1']})
    views = Parser::Views.new({path: '/home', ips: ['1.1.1.1']})

    expect(reader).to receive(:stream).and_yield('/index', '1.1.1.1')
    expect(repository).to receive(:add_visit).with('/index', '1.1.1.1')
    expect(repository).to receive(:visits).and_return(visits)
    expect(repository).to receive(:views).and_return(views)
    expect(printer).to receive(:table).with(views)
    expect(printer).to receive(:table).with(visits)

    subject.run
  end
end
