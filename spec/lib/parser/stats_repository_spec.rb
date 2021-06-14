require 'spec_helper'
require 'parser/stats_repository'

describe "Parser::StatsRepository" do
  subject { Parser::StatsRepository.new() }

  it "stores a visit" do
    subject.add_visit("/home", "1.1.1.1")

    expect(subject.visits).to eql({"/home" => 1})
  end
end
