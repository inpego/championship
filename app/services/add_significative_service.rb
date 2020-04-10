# frozen_string_literal: true

class AddSignificativeService
  attr_reader :significative, :player, :match

  def initialize(significative_id, player_id, match_id)
    @significative = Significative.find(significative_id)
    @player = Player.find(player_id)
    @match = Match.find(match_id)
  end

  def call
    MatchSignificative.create(player: player, significative: significative, match: match)
  end
end
