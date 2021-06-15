# frozen_string_literal: true

class Parser
  # The StatsRepository is an in-memory repository for storing visits
  class StatsRepository
    def initialize
      @store = {}
    end

    def add_visit(path, ip)
      store.update({ path => [ip] }) do |_ip, recorded_visits, new_visit|
        recorded_visits + new_visit
      end
    end

    def visits
      summary = store.reduce({}) do |stats, (path, visits)|
        stats[path] = visits.length
        stats
      end
    end

    def views; end

    private

    attr_reader :store
  end
end
