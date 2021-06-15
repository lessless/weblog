# frozen_string_literal: true

require 'spec_helper'
require 'parser/stats_repository'

describe 'Parser::StatsRepository' do
  subject { Parser::StatsRepository.new }

  context 'visits' do
    it 'stores a new visit' do
      subject.add_visit('/home', '1.1.1.1')

      expect(subject.visits).to eql({ '/home' => 1 })
    end

    it 'increases number of vistis for already recorded path' do
      subject.add_visit('/home', '1.1.1.1')
      subject.add_visit('/home', '1.1.1.1')

      expect(subject.visits).to eql({ '/home' => 2 })
    end
  end

  context 'visits' do
    it 'counts multiple visits from the same ip as a single view' do
      subject.add_visit('/home', '1.1.1.1')
      subject.add_visit('/home', '1.1.1.1')

      expect(subject.views).to eql({ '/home' => 1 })
    end
  end
end
