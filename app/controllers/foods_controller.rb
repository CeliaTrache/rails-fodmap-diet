class FoodsController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :index ]

  def index
    @foods_to_eat = Food.where(to_avoid: false)
    @foods_to_avoid = Food.where(to_avoid: true)
  end
end
