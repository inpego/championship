# frozen_string_literal: true

module Significatives
  class TeamsController < ApplicationController
    def index
      render json: TopSignificativeService.new(params[:significative_id]).call
    end

    def show
      render json: TopSignificativeService.new(params[:significative_id], params[:id]).call
    end
  end
end
