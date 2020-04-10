# frozen_string_literal: true

class TopSignificativeService
  TOP_COUNT = 5

  attr_reader :significative, :team

  def initialize(significative_id, team_id = nil)
    @significative = Significative.find(significative_id)
    @team = Team.find(team_id) if team_id
  end

  def call
    scope = MatchSignificative.select('players.*, COUNT(match_significatives.id) as cnt')
                              .joins(:player)
                              .where(significative: significative)
                              .group('players.id')
                              .order('COUNT(match_significatives.id) DESC, players.name ASC')
                              .limit(TOP_COUNT)
    scope = scope.where('team_id = ?', team.id) if team
    scope
  end
end
