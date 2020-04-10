# frozen_string_literal: true

class TeamsController < ApplicationController
  def index
    render json: Team.order(name: :asc).all
  end

  def show
    render json: Player.where(team_id: params[:id]).order(name: :asc).all
  end
end
