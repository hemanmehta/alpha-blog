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

    def new
        #Initialize only once when blank form submitted and error messages printed.
        @article = Article.new
    end

    def create
        #To print the paremeters for debugging in browser.
        #render plain: params[:article]

        #Whitelisting parameters from request aka Strong Parameters
        #If we dont whitelist parameters then it will show ForbiddenAttributeError
        #@article = Article.new(params.require(:TOP_LEVEL_KEY).permit(:KEY1, :KEY2))
        @article = Article.new(params.require(:article).permit(:title, :description))
        # render plain: @article.inspect
        
        if @article.save
            flash[:notice] = "Article was created Successfully."
            #redirecting page to show article details
            #redirect_to article_path(@article)
            redirect_to @article
        else
            render 'new'
        end
    end

end