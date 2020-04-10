# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Significatives::Teams', type: :request do
  subject { JSON.parse(response.body).map { |player| player['name'] } }

  let(:significative) { Significative.find_by(name: 'сделал 70+% точных передач') }

  describe 'GET #index' do
    before { get "/significatives/#{significative.id}/teams" }

    it 'shows top five players with given significative from all teams' do
      expect(subject).to eq(['Илья Брановец', 'Скитов Артём', 'Чалов Даниил', 'Артём Сороко', 'Коанда Сулейман'])
    end
  end

  describe 'GET #show' do
    before do
      team = Team.find_by(name: 'Слуцк')
      get "/significatives/#{significative.id}/teams/#{team.id}"
    end

    it 'shows top five players with given significative from given team' do
      expect(subject).to eq(['Илья Брановец', 'Коанда Сулейман', 'Борис Панкратов', 'Виталий Трубило'])
    end
  end
end
