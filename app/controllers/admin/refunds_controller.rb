class Admin::RefundsController < ApplicationController
	def index
    	@refunds = Refund.order(:id => :desc).page(params[:page]).per(10)
  	end

  	def new
  		@refund = Refund.new
  		@users=User.all
  	end

  	def create
  		@refund = Refund.new(refund_params)
      respond_to do |format|
        if @refund.save
          	format.html { redirect_to admin_refunds_url, notice: 'Refunds was successfully created.' }
        else
        	@users=User.all
          	format.html { render :new }
        end
      end
  	end

  	def show
  		@refund = Refund.find(params[:id])
  	end

  	def edit
      @refund = Refund.find(params[:id])
      @users=User.all
  	end

  	def update
      @refund=Refund.find params[:id]
      respond_to do |format|
        if @refund.update(refund_params)
          format.html { redirect_to admin_refunds_url, notice: 'Refund was successfully updated.' }
        else
          format.html { render :edit }
        end
      end
  	end

  	def destroy
      Refund.find(params[:id]).destroy
      respond_to do |format|
        format.html { redirect_to admin_refunds_url, notice: 'Refund was successfully destroyed.' }
        format.json { head :no_content }
      end
  	end

  	private
    def refund_params
     params.require(:refund).permit(:user_id ,:amount,:is_active)
    end

end
