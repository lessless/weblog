# frozen_string_literal: true

require 'spec_helper'
require 'parser/visits'

describe 'Parser::Visits' do
  subject { Parser::Visits.new }

  context '#as_table' do
    it 'formats visits as table' do
      subject.add_visit('/home', '1.1.1.1')

      expect(subject.visits).to eql({ '/home' => 1 })
    end
  end
end
