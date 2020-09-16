class Admin::NewsController < ApplicationController
	def index
    	@news = News.order(:id => :desc).page(params[:page]).per(10)
  	end

  	def new
  		@news = News.new
  	end

  	def create
  		@news = News.new(news_params)
      respond_to do |format|
        if @news.save
          format.html { redirect_to admin_news_index_url, notice: 'News was successfully created.' }
        else
          @country=Country.all
          format.html { render :new }
        end
      end
 
		
  	end

  	def show
  		@news = News.find(params[:id])
 
		
  	end

  	def edit

  	end

  	def update
      @news=News.find params[:id]
      respond_to do |format|
        if @news.update(news_params)
          format.html { redirect_to admin_news_index_url, notice: 'User was successfully updated.' }
        else
          format.html { render :edit }
        end
      end
  	end

  	def destroy

  	end

    def news_params
     params.require(:news).permit(:title ,:content)
    end
end
