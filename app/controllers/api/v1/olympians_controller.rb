class Api::V1::OlympiansController < ApplicationController
  before_action :set_olympian, only: [:show]


  def index
    render json: OlympianSerializer.new(Olympian.select('distinct on (name) *'))
  end

  def show
    render json: OlympianSerializer.new(@olympian)
  end

private

  def set_olympian
    if(params.has_key?(:age) && params.has_value?('youngest'))
      @olympian = Olympian.youngest
    elsif(params.has_key?(:age) && params.has_value?('oldest'))
      @olympian = Olympian.oldest
    end
  end

end
