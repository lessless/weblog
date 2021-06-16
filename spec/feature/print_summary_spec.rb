# frozen_string_literal: true

require 'spec_helper'

describe 'Parsing a log file' do
  let(:logfile) { 'spec/fixtures/webserver.log' }

  it 'prints summary' do
    expect { system("./bin/parser -f #{logfile}") }.to output(<<~TABLE).to_stdout_from_any_process
      +--------+------------------+
      | Page   | Number of visits |
      +--------+------------------+
      | /home  | 3                |
      | /index | 2                |
      +--------+------------------+

      +--------+-----------------+
      | Page   | Number of views |
      +--------+-----------------+
      | /home  | 2               |
      | /index | 2               |
      +--------+-----------------+
    TABLE
  end
end
