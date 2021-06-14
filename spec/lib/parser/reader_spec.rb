require 'spec_helper'
require 'parser/reader'

describe "Parser::Reader" do

  subject { Parser::Reader.new(logfile) }

  context "when parsing a file" do
    let(:logfile) { "spec/fixtures/minimal.log" }

    it "passes log file entries to the injected object line by line" do
      collector = []

      subject.stream() { |path, ip| collector << [path, ip] }

      expect(collector).to eql([["/home", "1.1.1.1"]])
    end
  end
end
