class RakutenController < ApplicationController
	def index
		render layout: 'rakuten'
	end

	def category
		require 'open-uri'
		id=params[:id]
		file = open("https://app.rakuten.co.jp/services/api/IchibaItem/Search/20170706?format=json&genreId=#{id}&applicationId=1054652538039093106&application_secret=7044bc5b1790bfa08d79403d2ed990cf06b06bd5")
		@data = JSON.parse(file.read)
	end

	def detail
		require 'open-uri'
		id=params[:id]
		file = open("https://app.rakuten.co.jp/services/api/IchibaItem/Search/20170706?format=json&itemCode=#{id}&applicationId=1054652538039093106&application_secret=7044bc5b1790bfa08d79403d2ed990cf06b06bd5")
		@data = JSON.parse(file.read)
	end
end
