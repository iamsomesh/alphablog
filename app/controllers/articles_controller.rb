class ArticlesController < ApplicationController
  before_action :set_article, only: %i[show edit update destroy]

  def index
    @articles = Article.all
  end

  def show; end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)
    if @article.save
      flash[:notice] = "Article was created successfully"
      redirect_to @article
    else
      render "new"
    end
    # redirect_to article_path(@article) #we can redirect to article/id here @article gives id
    # render plain: params[:article]
  end

  def edit; end

  def update
    @article.update(article_params)
    if @article.save
      flash[:notice] = "Article was updated successfully"
      redirect_to @article
    else
      render "edit"
    end
  end

  def destroy
    @article.destroy
    redirect_to articles_path
  end

  private

  def set_article
    @article = Article.find(params[:id])
  end

  def article_params
    params.require(:article).permit(:title, :description)
  end
end
