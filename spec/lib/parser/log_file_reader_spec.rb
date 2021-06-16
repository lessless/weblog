# frozen_string_literal: true

require 'spec_helper'
require 'parser/log_file_reader'
require 'parser/log_entry'

describe 'Parser::LogFileReader' do
  subject { Parser::LogFileReader.new(logfile) }

  context 'when parsing a file' do
    let(:logfile) { 'spec/fixtures/minimal.log' }

    it 'passes log file entries to the injected object line by line' do
      collector = []

      subject.stream { |path, ip| collector << { path: path, ip: ip } }

      expect(collector).to eql([{ path: '/home', ip: '1.1.1.1' }])
    end
  end

  context 'when parsing a file with empty lines at the end' do
    let(:logfile) { 'spec/fixtures/minimal_with_empty_line.log' }

    it 'skips them' do
      collector = []

      subject.stream { |path, ip| collector << { path: path, ip: ip } }

      expect(collector).to eql([{ path: '/home', ip: '1.1.1.1' }])
    end
  end
end
