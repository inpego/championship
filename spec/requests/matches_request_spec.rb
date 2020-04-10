require 'rails_helper'

RSpec.describe 'Matches', type: :request do
  describe 'GET #index' do
    subject { JSON.parse(response.body).map { |match| match['result'] } }

    before { get '/' }

    it('shows all matches from new to old') { expect(subject).to eq(%w[1:2 1:0 1:3 1:1 0:0 2:1]) }
  end
end
