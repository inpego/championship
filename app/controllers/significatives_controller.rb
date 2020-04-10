# frozen_string_literal: true

class SignificativesController < ApplicationController
  def index
    render json: Significative.order(name: :asc).all
  end
end
