class Game < ActiveRecord::Base
	has_many :posts

	def to_s
		name
	end

	  def games_picture
	    game = name.gsub(/[ ':]/, '-').downcase
			diablo3 = "diablo-3-reaper-of-souls"
			diablo3["3"]= "iii"
	    codmw1 = "call-of-duty-modern-warfare"
	    codmw1["call-of-duty-modern-warfare"]= "call-of-duty-4-modern-warfare"
	    blackops2 = "call-of-duty-black-ops-2"
	    blackops2["2"]= "ii"
	    blackops3 = "call-of-duty-black-ops-3"
	    blackops3["3"]= "iii"
	    ds2 = "dark-souls-2"
	    ds2["2"]= "ii"
	    ds3  =  "dark-souls-3"
	    ds3["3"]= "iii"

	      if game == "call-of-duty-black-ops-2"
	        game =  blackops2
	      elsif game == "call-of-duty-black-ops-3"
	        game = blackops3
	      elsif game == "call-of-duty-modern-warfare"
	        game = codmw1
	      elsif game == "dark-souls-2"
	        game = ds2
	      elsif game == "dark-souls-3"
	        game = ds3
				elsif game == "diablo-3-reaper-of-souls"
					game = diablo3
	      end

	    page = HTTParty.get("https://www.igdb.com/games/#{game}").parsed_response
	       parse_page = Nokogiri::HTML(page)

	       url = "https:" + parse_page.css('.inline-block img')[0]['srcset']
	      url =  url.split(',')[0]
	   end

end
