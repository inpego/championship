# frozen_string_literal: true

class Significative < ApplicationRecord
  has_many :match_significatives, dependent: :destroy
  has_many :matches, through: :match_significatives
  has_many :players, through: :match_significatives
end
