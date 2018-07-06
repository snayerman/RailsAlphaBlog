class ArticlesController < ApplicationController
   def index
      @articles = Article.all
   end

   def new
      @article = Article.new()
   end

   def edit
      @article = Article.find(params[:id])
   end

   def update
      @article = Article.find(params[:id])
      if @article.update(article_params())
         flash[:notice] = "Article was successfuly updated!"
         redirect_to article_path(@article)
      else
         render 'edit'
      end
   end

   def create
      # render plain: params[:article].inspect()
      @article = Article.new(article_params())
      if @article.save()
         # puts "Article success!!!!!!!!!!!"
         flash[:notice] = "Article was successfuly created!"
         redirect_to article_path(@article)
      else
         render 'new' #same as render :new
         # render :new
      end
   end

   def show()
      @article = Article.find(params[:id])
   end

   def destroy()
      @article = Article.find(params[:id])
      @article.destroy()

      flash[:notice] = "Article was successfuly destroyed"
      redirect_to articles_path()
   end

   private
      def article_params()
         params.require(:article).permit(:title, :description)
      end
end