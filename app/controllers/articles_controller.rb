class ArticlesController < ApplicationController
    #We need to call set_article method for some actions before any invocation for that we can use
    #before_action :method_name, only: [:action1, :action2]
    #set_article method will be called for below 4 action prior execution of respective action body part.
    before_action :set_article, only: [:show, :edit, :update, :destroy]

    def show
        #Creating instance variable @article to fetch article based on index.
        #[:id] will reflect index passed from URL
        #Enable byebug for debugging and observe WebServer running console
        #byebug
        #@article = Article.find(params[:id])
    end

    def index
        @articles = Article.all
    end

    def new
        #Initialize only once when blank form submitted and error messages printed.
        @article = Article.new
    end

    def edit
        #@article = Article.find(params[:id])
    end

    def create
        #To print the paremeters for debugging in browser.
        #render plain: params[:article]

        #Whitelisting parameters from request aka Strong Parameters
        #If we dont whitelist parameters then it will show ForbiddenAttributeError
        #@article = Article.new(params.require(:TOP_LEVEL_KEY).permit(:KEY1, :KEY2))
        #@article = Article.new(params.require(:article).permit(:title, :description))
        @article = Article.new(article_params)
        @article.user = User.first
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

    def update
        #@article = Article.find(params[:id])
        #if @article.update(params.require(:article).permit(:title, :description))
        if @article.update(article_params)
            flash[:notice] = "Article updates Successfully."
            redirect_to @article
        else
            render 'edit'
        end
    end

    def destroy
        #@article = Article.find(params[:id])
        @article.destroy
        redirect_to articles_path
    end
    
    #Creating private method, It will be accessible to current controllers
    #Any methods written below private keyword would be unusable outside controller so always write at bottom.
    private

    def set_article
        @article = Article.find(params[:id])
    end

    #Creating article_params method for update,create actions refactoring
    def article_params
        params.require(:article).permit(:title, :description)
    end
end