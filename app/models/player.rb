# frozen_string_literal: true

class Player < ApplicationRecord
  belongs_to :team
  has_many :match_significatives, dependent: :destroy
  has_many :matches, through: :match_significatives
  has_many :significatives, through: :match_significatives

  validates :name, presence: true
end
