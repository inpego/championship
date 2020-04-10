# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Significatives::Players', type: :request do
  describe 'PATCH #update' do
    let(:significative) { Significative.first }
    let(:player) { Player.last }
    let(:match) { Match.first }

    subject { MatchSignificative.last }

    context 'when match_id is present' do
      it 'creates significative record for specified player and match' do
        expect do
          patch "/significatives/#{significative.id}/players/#{player.id}", params: { match_id: match.id }
        end.to change(MatchSignificative, :count).by(1)
        expect(response).to be_ok
        expect(subject).to have_attributes(player: player, significative: significative, match: match)
      end
    end

    context 'when match_id is missing' do
      it 'raises error' do
        expect { patch "/significatives/#{significative.id}/players/#{player.id}" }.to raise_error(
          ActionController::ParameterMissing
        )
      end
    end
  end

  describe 'GET #show' do
    subject { JSON.parse(response.body) }

    let(:player) { Player.find_by(name: 'Клопоцкий Евгений') }

    before { get "/significatives/#{significative.id}/players/#{player.id}" }

    context 'when player has received given significative in last five matches' do
      let(:significative) { Significative.find_by(name: 'сделал 70+% точных передач') }

      it 'returns found: true' do
        expect(subject).to eq('found' => true)
      end
    end

    context 'when player has not received given significative in last five matches' do
      let(:significative) { Significative.find_by(name: 'пробежал 10+ км') }

      it 'returns found: false' do
        expect(subject).to eq('found' => false)
      end
    end
  end
end
