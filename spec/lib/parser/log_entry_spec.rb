# frozen_string_literal: true

require 'spec_helper'
require 'parser/log_entry'

describe 'Parser::LogEntry' do
  subject { Parser::LogEntry.new }

  context '#from' do
    it 'extracts ip and hostname from valid string' do
      expect(subject.from('/home 1.1.1.1')).to eql({ path: '/home', ip: '1.1.1.1' })
    end

    it 'can handle empty string' do
      expect(subject.from('')).to eql({ path: '', ip: '' })
    end
  end

  context '#valid?' do
    it 'returns false if path is empty' do
      expect(subject.valid?({ path: '', ip: '1.1.1.1' })).to be_falsy
    end
  end
end
