class FoodsController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :index ]

  def index
    @foods = Food.all
  end
end
