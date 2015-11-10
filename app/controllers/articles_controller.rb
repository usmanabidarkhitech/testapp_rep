class ArticlesController < ApplicationController
  
  def index
    
  end
  
  def new 
    @article = Article.new
  end
  
  def create
    @article = Article.new(article_params)
    if @article.save
      redirect_to 'welcome_controller'
    else
      render 'welcome_controller'
    end
  end

  private
  def article_params
    params.require(:article).permit(:title,:text)
  end
end
