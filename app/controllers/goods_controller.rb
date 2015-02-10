class GoodsController < ApplicationController

  def index
    respond_with @goods = Good.all
  end

end
