# frozen_string_literal: true

require 'spec_helper'
require 'parser/visits'

describe 'Parser::Visits' do
  subject { Parser::Visits.new(page_visits) }

  context '#as_table' do
    let(:page_visits) { { '/aaa' => 1, '/zzz' => 2 } }

    it 'sorts table by amount of visits' do
      expect(subject.as_table).to eql({ headers: ['Page', 'Number of visits'], rows: [['/zzz', 2], ['/aaa', 1]] })
    end
  end
end
