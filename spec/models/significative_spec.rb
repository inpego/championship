# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Significative, type: :model do
  it { is_expected.to have_many(:match_significatives).dependent(:destroy) }
  it { is_expected.to have_many(:matches).through(:match_significatives) }
  it { is_expected.to have_many(:players).through(:match_significatives) }
end
