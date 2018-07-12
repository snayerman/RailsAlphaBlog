class ArticlesController < ApplicationController
   before_action :verifyLoggedIn
   before_action :set_article, only: [:edit, :update, :show, :destroy]

   def index
      # @articles = Article.all
      @articles = Article.paginate(:page => params[:page], per_page: 4).order('created_at DESC')
   end

   def new
      @article = Article.new()
   end

   def edit
   end

   def update
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
   end

   def destroy()
      @article.destroy()

      flash[:notice] = "Article was successfuly destroyed"
      redirect_to articles_path()
   end

   private
      def set_article()
         @article = Article.find(params[:id])
      end

      def article_params()   
         params.require(:article).permit(:title, :description).merge(user_id: getCurrUser().id)
      end

      def verifyLoggedIn()
         if !loggedIn?()
            redirect_to '/'
         end
      end
end