class ArticlesController < ApplicationController

    #before_action : find_article, only:[:show,:edit,:update,:destroy]
    before_action :find_article, except:[ :new, :create, :index]
    before_action :authenticate_user!, only: [ :new, :create, :edit, :update, :destroy]
    def index
        @articles = Article.all
    end

    def show       
    end

    def new
        @article = Article.new
    end

    def create
        @article = Article.create(title: params[:article][:title] , content: params[:article][:content])
       # render json:@article
       redirect_to @article
    end

    def edit
    end

    def update
        @article.update(title: params[:article][:title] , content: params[:article][:content])
        redirect_to @article
    end

    def destroy
         @article.destroy
        redirect_to root_path
    end

    def find_article
        @article = Article.find(params[:id])
    end

end
