class ArticlesController < ApplicationController
    def show
        #Creating instance variable @article to fetch article based on index.
        #[:id] will reflect index passed from URL
        #Enable byebug for debugging and observe WebServer running console
        #byebug
        @article = Article.find(params[:id])
    end

    def index
        @articles = Article.all
        
    end
end