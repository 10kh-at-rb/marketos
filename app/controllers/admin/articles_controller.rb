class Admin::ArticlesController < Admin::AdminController
  load_and_authorize_resource

  def index
    respond_with @articles
  end

  def show
    respond_with @article
  end

  def edit
    respond_with @article
  end

  def update
    @article.update(article_params)
    respond_with @article
  end

  private
  def article_params
    params.require(:article).permit(:title, :body)
  end

end