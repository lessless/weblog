# frozen_string_literal: true

require 'spec_helper'
require 'parser/log_file_reader'
require 'parser/log_entry'

describe 'Parser::LogFileReader' do
  it 'sends log file entries to a collaborator line by line' do
    reader = Parser::LogFileReader.new('spec/fixtures/minimal.log')
    collector = []

    reader.stream { |path, ip| collector << { path: path, ip: ip } }

    expect(collector).to eql([{ path: '/home', ip: '1.1.1.1' }])
  end

  it 'skips empty line at the end of file' do
    reader = Parser::LogFileReader.new('spec/fixtures/minimal_with_empty_line.log')
    collector = []

    reader.stream { |path, ip| collector << { path: path, ip: ip } }

    expect(collector).to eql([{ path: '/home', ip: '1.1.1.1' }])
  end

  it "exits if can't open file" do
    reader = Parser::LogFileReader.new('a/non/existing/file')

    expect(reader).to receive(:exit!)

    reader.stream
  end
end
