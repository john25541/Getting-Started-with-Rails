class ArticlesController < ApplicationController
    
    def new
        @article = Article.new
    end

    def edit
        @article = Article.find(params[:id])
    end

    def create
        @article = Article.new(article_params)

        if  @article.save
            redirect_to @article

        else
            render 'new'
        end
    end
    def update
        @articles = Article.find(params[:id])

        if @articles.update(article_params)
            redirect_to @articles
        else
            render 'edit'
        end
    end
    
    def destroy
        @article = Article.find(params[:id])
        @article.destroy
        redirect_to articles_path
    end

    http_basic_authenticate_with name: "john25541" , password: "Nguyenvanloc..." , except: [:index, :show]

    
    def index
        @articles = Article.all
    end

    def show
        @article = Article.find(params[:id])
    end
    
    private
        def article_params 
            params.require(:article).permit(:title, :text)
        end

    
end
