# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Player, type: :model do
  it { is_expected.to belong_to(:team) }
  it { is_expected.to have_many(:match_significatives).dependent(:destroy) }
  it { is_expected.to have_many(:matches).through(:match_significatives) }
  it { is_expected.to have_many(:significatives).through(:match_significatives) }
  it { is_expected.to validate_presence_of(:name) }
end
