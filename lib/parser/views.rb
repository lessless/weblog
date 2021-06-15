# frozen_string_literal: true

class Parser
  # The Views class represent a collection of unique views
  class Views
    def initialize(page_views)
      @page_views = page_views
    end

    def as_table
      { headers: ['Page', 'Number of views'], rows: page_views.to_a.sort_by { |page_views| -page_views[1] } }
    end

    private

    attr_reader :page_views
  end
end
