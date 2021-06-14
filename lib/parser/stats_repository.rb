class Parser
  class StatsRepository
    def initialize()
      @store = {}
    end

    def add_visit(path, ip)
      store.update({path => [ip]})
    end

    def visits
      store.reduce({}) do |stats, (path, visits)|
        stats[path] = visits.length
        stats
      end
    end

    private
    attr_reader :store
  end
end
