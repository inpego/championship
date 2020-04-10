# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Match, type: :model do
  it { is_expected.to belong_to(:team_one).class_name('Team') }
  it { is_expected.to belong_to(:team_two).class_name('Team') }
  it { is_expected.to have_many(:match_significatives).dependent(:destroy) }
  it { is_expected.to have_many(:players).through(:match_significatives) }
  it { is_expected.to have_many(:significatives).through(:match_significatives) }
  it { is_expected.to validate_presence_of(:result) }
end
