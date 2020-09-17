class Admin::FaqsController < ApplicationController

	def index
    	@faqs = Faq.order(:id => :desc).page(params[:page]).per(10)
  	end

	def new
  		@faq = Faq.new
  	end

  	def create
  		@faq = Faq.new(faq_params)
      respond_to do |format|
        if @faq.save
          format.html { redirect_to admin_faqs_url, notice: 'Faq was successfully created.' }
        else
          format.html { render :new }
        end
      end
 
		
  	end

  	def show
  		@faq = Faq.find(params[:id])
 
		
  	end

  	def edit
      @faq = Faq.find(params[:id])
  	end

  	def update
      @faq=Faq.find params[:id]
      respond_to do |format|
        if @faq.update(faq_params)
          format.html { redirect_to admin_faqs_url, notice: 'FAQ was successfully updated.' }
        else
          format.html { render :edit }
        end
      end
  	end

  	def destroy
      Faq.find(params[:id]).destroy
      respond_to do |format|
        format.html { redirect_to admin_faqs_url, notice: 'FAQ was successfully destroyed.' }
        format.json { head :no_content }
      end
  	end

  	private

    def faq_params
     params.require(:faq).permit(:question ,:answer)
    end
end
