class Admins::ProductsController < ApplicationController
  before_action :authenticate_admin!, only: [:show, :index]
  def index
  end

  def new
  end

  def create
  end

  def show
  end

  def edit
  end

  def update
  end
end
