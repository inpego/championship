# frozen_string_literal: true

class MatchSignificative < ApplicationRecord
  belongs_to :match
  belongs_to :player
  belongs_to :significative
end
