# frozen_string_literal: true

# Test class to be used as a Printer collaborator
class TestPrintable
  def as_table
    { headers: ['A HEADER'], rows: [['A ROW']] }
  end
end
