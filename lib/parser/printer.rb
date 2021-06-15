# frozen_string_literal: true
require 'terminal-table'
require 'awesome_print'

class Parser
  # The Printer's class sole concern is to print stats to the terminal.
  # It expects collaborator to respond to #as_table method

  class Printer
    def table(printable)
      table = printable.as_table
      ascii_table = Terminal::Table.new headings: table[:headers], rows: table[:rows]
      puts ascii_table
    end
  end
end
