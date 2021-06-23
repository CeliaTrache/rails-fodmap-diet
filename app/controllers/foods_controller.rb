class FoodsController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :index ]

  def index
    @foods_to_eat = Food.where(to_avoid: false)
    @foods_to_avoid = Food.where(to_avoid: true)
    @foods = Food.all

    if params[:query].present?
      @foods = Food.where('name LIKE ?', "#{params[:query]}%")
    end

    respond_to do |format|
      format.html # Follow regular flow of Rails
      format.text { render partial: 'list.html', locals: { foods: @foods } }
    end
  end
end
