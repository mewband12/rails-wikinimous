class ArticlesController < ApplicationController
  def index
    @articles = Article.all
  end

  def create
    @article = Article.new(articles_params)
    if @article.save
      redirect_to article_path(@article)
    else
      render 'articles/new'
    end
  end

  def new
    @article = Article.new
  end

  def edit
    @articles = Article.all
    @article = @articles.find(params[:id])
  end

  def show
    @articles = Article.all
    @article = @articles.find(params[:id])
  end

  def update
    @articles = Article.all
    @article = @articles.find(params[:id])
    if @article.update(articles_params)
      redirect_to article_path(@article)
    else
      render :edit
    end
  end

  def destroy
    @articles = Article.all
    @article = @articles.find(params[:id])
    @article.destroy
    redirect_to articles_path
  end

  private

  def articles_params
    params.require(:article).permit(:title, :content)
  end
end
