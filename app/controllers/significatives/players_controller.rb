# frozen_string_literal: true

module Significatives
  class PlayersController < ApplicationController
    def update
      if AddSignificativeService.new(params[:significative_id], params[:id], match_id).call
        render :ok
      else
        render :unprocessable_entity
      end
    end

    def show
      render json: { found: CheckSignificativeService.new(params[:significative_id], params[:id]).call }
    end

    private

    def match_id
      params.require(:match_id)
    end
  end
end
