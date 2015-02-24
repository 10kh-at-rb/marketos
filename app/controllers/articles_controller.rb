class ArticlesController < ApplicationController

  load_and_authorize_resource

  def show
    respond_with @article
  end

end