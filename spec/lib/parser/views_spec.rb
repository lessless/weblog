# frozen_string_literal: true

require 'spec_helper'
require 'parser/views'

describe 'Parser::Views' do
  subject { Parser::Views.new(page_views) }

  context '#as_table' do
    let(:page_views) { { '/aaa' => 1, '/zzz' => 2 } }

    it 'sorts table by amount of views' do
      expect(subject.as_table).to eql({ headers: ['Page', 'Number of views'], rows: [['/zzz', 2], ['/aaa', 1]] })
    end
  end
end
