# frozen_string_literal: true

require 'spec_helper'
require 'parser/printer'

describe 'Parser::Printer' do
  subject { Parser::Printer.new }

  context '#table' do
    it "prints collbarator's #as_table to stdout" do
      expect { subject.table(TestPrintable.new) }.to output(<<~TABLE).to_stdout
        +----------+
        | A HEADER |
        +----------+
        | A ROW    |
        +----------+
      TABLE
    end
  end
end
