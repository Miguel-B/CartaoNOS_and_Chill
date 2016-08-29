class MoviesController < ApplicationController
  def index
  	@movies = Movie.all
  	test
 end

private

def getJson
	require 'open-uri'
  	require 'json'
  	json = open("https://extraction.import.io/query/extractor/b3b67e62-f64a-4b4b-a5ab-a472e09f92fb?_apikey=9cca7ae48a844c0ea86df40903fd3f95bf32a12bf85f84daf1f5ffeaac61dd2ca3e69416012f012a8a8f6798e1245b82a9ed94e29ee4c2766830bf29cbc9e3b0c2ed88f05d7de81c88ecff4d6590d06d&url=http%3A%2F%2Fmag.sapo.pt%2Fcinema%2Ffilmes%2Fthe-shallows").read
end

def test
	mov = Movie.new
	mov.title = "test"
	mov.director = "director"
	mov.actors = "d, f, 1, 3"
	mov.synopsis = "ewrtyr wegtey wt4ye4ye wte4wtwefhwifew wieinfiwejf ijfewnjn"
	mov.time = "00h:00m"
	mov.poster = "null"
	mov.save
end

end
