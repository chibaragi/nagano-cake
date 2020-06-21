class Admins::OrdersController < ApplicationController
  def index
  end

  def top
    @orders=Order.where(created_at: Date.today)

  end

  def show
  end

  def update
  end
end
