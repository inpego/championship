# frozen_string_literal: true

class Match < ApplicationRecord
  belongs_to :team_one, class_name: 'Team'
  belongs_to :team_two, class_name: 'Team'
  has_many :match_significatives, dependent: :destroy
  has_many :players, through: :match_significatives
  has_many :significatives, through: :match_significatives

  validates :result, presence: true
end
