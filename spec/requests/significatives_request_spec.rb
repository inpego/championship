# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Significatives', type: :request do
  describe 'GET #index' do
    before { get '/significatives' }

    subject { JSON.parse(response.body).map { |significative| significative['name'] } }

    it 'shows all available significatives alphabetically' do
      expect(subject).to eq(['пробежал 10+ км', 'сделал 70+% точных передач'])
    end
  end
end
