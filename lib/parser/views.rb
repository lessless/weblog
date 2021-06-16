# frozen_string_literal: true

class Parser
  # The Views class represent a collection of unique views
  class Views
    def initialize(stats)
      @stats = stats
    end

    def as_table
      sorted_views = sort(page_views)
      { headers: ['Page', 'Number of views'], rows:  sorted_views}
    end

    private

    attr_reader :stats

    def page_views
      stats.map do |path, src_ips|
        stats[path] = views_count(src_ips)
        stats
      end
    end

    def sort(page_views)
      page_views.to_a.sort_by { |page_views| -page_views[1] }
    end

    def views_count(src_ips)
      if src_ips.none? {|src_ip| Parser::IPAddress.valid?(src_ip)}
        '<Unknown>'
      else
        src_ips.uniq.length
      end
    end
  end
end
