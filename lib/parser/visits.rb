# frozen_string_literal: true

class Parser
  # The Visits class represent a collection of visits
  class Visits
    def initialize(page_visits)
      @page_visits = page_visits
    end

    def as_table
      { headers: ['Page', 'Number of visits'], rows: page_visits.to_a }
    end

    private

    attr_reader :page_visits
  end
end
