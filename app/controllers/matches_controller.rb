# frozen_string_literal: true

class MatchesController < ApplicationController
  def index
    render json: Match.order(created_at: :desc).all
  end
end
