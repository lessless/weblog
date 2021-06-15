# frozen_string_literal: true

require 'spec_helper'
require 'parser/visits'

describe 'Parser::Visits' do
  subject { Parser::Visits.new(page_visits) }

  context '#as_table' do
  let(:page_visits) {{ '/home' => 1 }}
    it 'formats visits as table' do

      expect(subject.as_table).to eql({headers: ["Page", "Number of visits"], rows: [["/home", 1]]})
    end
  end
end
