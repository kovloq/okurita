class Admin::NewsController < ApplicationController
  before_action :authorized
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
          format.html { render :new }
        end
      end
 
		
  	end

  	def show
  		@news = News.find(params[:id])
 
		
  	end

  	def edit
      @news = News.find(params[:id])
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
      News.find(params[:id]).destroy
      respond_to do |format|
        format.html { redirect_to admin_news_index_url, notice: 'News was successfully destroyed.' }
        format.json { head :no_content }
      end
  	end

    def news_params
     params.require(:news).permit(:title ,:content)
    end
end
