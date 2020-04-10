# frozen_string_literal: true

class CheckSignificativeService
  LAST_MATCHES_COUNT = 5

  attr_reader :significative, :player

  def initialize(significative_id, player_id)
    @significative = Significative.find(significative_id)
    @player = Player.find(player_id)
  end

  def call
    last_matches_query = Match.select(:id).order(created_at: :desc).limit(LAST_MATCHES_COUNT).to_sql
    MatchSignificative.where(player: player, significative: significative)
                      .where("match_id IN (#{last_matches_query})")
                      .exists?
  end
end
