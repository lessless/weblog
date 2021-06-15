# frozen_string_literal: true

require 'spec_helper'

describe 'Parsing a log file' do
  let(:logfile) { 'spec/fixtures/webserver.log' }

  it 'outputs amount of page visits' do
    expect { system("./bin/parser #{logfile}") }.to output(<<~TABLE).to_stdout_from_any_process
      +--------+------------------+
      | Page   | Number of visits |
      +--------+------------------+
      | /home  | 3                |
      | /index | 2                |
      +--------+------------------+
    TABLE
  end
end
