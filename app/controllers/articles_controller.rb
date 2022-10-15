class ArticlesController < ApplicationController
  def index
    @articles = Article.all
  end

  def show
    @article = Article.find(params[:id])
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(params.require(:article).permit(:title, :description))
    if @article.save
      flash[:notice] = "Article was created successfully"
      redirect_to @article
    else
      render "new"
    end
    # redirect_to article_path(@article) #we can redirect to article/id here @article gives id
    # render plain: params[:article]
  end

  def edit
    @article = Article.find(params[:id])
  end

  def update
    @article = Article.find(params[:id])
    @article.update(params.require(:article).permit(:title, :description))
    if @article.save
      flash[:notice] = "Article was updated successfully"
      redirect_to @article
    else
      render "edit"
    end
  end

  def destroy
    @article = Article.find(params[:id])
    @article.destroy
    redirect_to articles_path
  end
end
