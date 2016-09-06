class MoviesController < ApplicationController

 require 'net/http'

 def index
  	@movies = Movie.all
  	clear
  	import
  	@theatres = @@cinemas
 end

private

@@cinemas = Array.new

def import

	@apiKey = "9cca7ae48a844c0ea86df40903fd3f95bf32a12bf85f84daf1f5ffeaac61dd2ca3e69416012f012a8a8f6798e1245b82a9ed94e29ee4c2766830bf29cbc9e3b0c2ed88f05d7de81c88ecff4d6590d06d"
	@cinema_one = "&url=http%3A%2F%2Fmag.sapo.pt%2Fcinema%2Fsalas%2Fcinemas-nos-parque-nascente-gondomar%3Flocal%3D13"
	@cinema_two = "&url=http%3A%2F%2Fmag.sapo.pt%2Fcinema%2Fsalas%2Fcinemas-nos-dolce-vita-porto%3Flocal%3D13"
	@cinema_three = "&url=http%3A%2F%2Fmag.sapo.pt%2Fcinema%2Fsalas%2Fcinemas-nos-marshopping%3Flocal%3D13"
	@cinema_four = "&url=http%3A%2F%2Fmag.sapo.pt%2Fcinema%2Fsalas%2Fcinemas-nos-norteshopping%3Flocal%3D13"
	@base = "https://extraction.import.io/query/extractor/bfda33f7-797a-42e7-b0e5-06d13b40fc2f?_apikey="
	@allMoviesData = Array.new
	cinemaUrls = Array[@cinema_one, @cinema_two, @cinema_three, @cinema_four]
	
	cinemaUrls.each do |c|
		source = @base + @apiKey + c
	  	resp = Net::HTTP.get_response(URI.parse(source))
  		data = resp.body
  		hash = JSON.parse(data)
		cName = hash["extractorData"]["data"][0]["group"][0]["cinema"][0]["text"]
		@@cinemas.push(cName)
		@allMoviesData = hash["extractorData"]["data"][1]["group"]
		@allMoviesData.each do |x|
			movie = Movie.new
			movie.cinema = cName
			movie.title = x["title"][0]["text"]
			movie.version = x["version"][0]["text"]
			movie.sessions = x["sessions"][0]["text"]
			movie.save
		end
	end
end

def clear
	Movie.delete_all
end

end
