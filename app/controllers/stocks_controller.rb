class StocksController < ApplicationController
  def new
  	@stock = Stock.new
  end

  def create
  end
end
