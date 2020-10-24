class YshoppingController < ApplicationController
	def index
		render layout: 'yshopping'
	end

	def category
		# render layout: 'yshopping'	
# Client ID：
#     dj00aiZpPU11bUJLOGJybzVaZiZzPWNvbnN1bWVyc2VjcmV0Jng9NmE-
# シークレット：
#     2CWfGqcpKLFL7o0HKCo4GVzQvyrgQOICm7vxJGwG 
		require 'open-uri'
		id=params[:id]
		# @url="https://shopping.yahooapis.jp/ShoppingWebService/V3/itemSearch?appid=dj00aiZpPU11bUJLOGJybzVaZiZzPWNvbnN1bWVyc2VjcmV0Jng9NmE-&genre_category_id=#{id}&sort=-sold";
		file = open("https://shopping.yahooapis.jp/ShoppingWebService/V3/itemSearch?appid=dj00aiZpPU11bUJLOGJybzVaZiZzPWNvbnN1bWVyc2VjcmV0Jng9NmE-&genre_category_id=#{id}&sort=-sold")
		# @file=file;
		@data = JSON.parse(file.read)
	end

	def detail
		render layout: 'yshopping'
	end

end
