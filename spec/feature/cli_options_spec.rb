# frozen_string_literal: true

require 'spec_helper'

describe 'Parsing command line options' do
  it 'prints usage instructions if no parameters were given' do
    expect { system("./bin/parser") }.to output(/-f, --file FILE/).to_stdout_from_any_process
  end
end
