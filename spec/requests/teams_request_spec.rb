# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Teams', type: :request do
  subject { JSON.parse(response.body).map { |entry| entry['name'] } }

  describe 'GET #index' do
    before { get '/teams' }

    it 'shows all available teams alphabetically' do
      expect(subject).to eq(%w[Витебск Слуцк])
    end
  end

  describe 'GET #show' do
    before do
      team = Team.find_by(name: 'Слуцк')
      get "/teams/#{team.id}"
    end

    it 'shows all players in given team alphabetically' do
      expect(subject).to eq(['Борис Панкратов', 'Виталий Трубило', 'Денис Образов', 'Илья Брановец', 'Коанда Сулейман'])
    end
  end
end
