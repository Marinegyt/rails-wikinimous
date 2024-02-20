class ArticlesController < ApplicationController
  before_action :set_article, only: [:show, :edit, :update, :destroy]

  def index
    @articles = Article.all
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)
    @article.save

    redirect_to articles_path(@article)
  end

  def edit

  end

  def update
    @article.update(article_params)

    redirect_to article_path(@article)
  end

  def destroy
    @article.destroy

    redirect_to articles_path, status: :see_other
  end

  def show
  end

  private

  def set_article
    # Cette méthode privée me permet de refactoriser en ne répétant pas la même ligne dans plusieurs méthodes
    @article = Article.find(params[:id])
  end

  def article_params
    # Cette méthode gère les STRONG PARAMS => elle autorise sur le model restaurant l'accès aux params name, address et ratings
    params.require(:article).permit(:title, :content)
  end
end
