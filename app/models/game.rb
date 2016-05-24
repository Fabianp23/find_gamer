class Game < ActiveRecord::Base
  has_many :posts

  def to_s
    name
  end

  def games_picture
    fetch_games_picture || "http://placehold.it/600x500"
  end


  def fetch_games_picture
    game = name.gsub(/[ ':]/, '-').downcase
    pvs1 =  "plants-vs-zombies-garden-warfare-2e561d33-2b92-408a-92f2-ec79ddcc6c2b"
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
      elsif game == "plants-vs-zombies-garden-warfare"
        game = pvs1
      end

    page = HTTParty.get("https://www.igdb.com/games/#{game}").parsed_response
    parse_page = Nokogiri::HTML(page)

    return false if parse_page.css('.inline-block').empty?
    
    url = "https:" + parse_page.css('.inline-block img')[0]['srcset']
    url =  url.split(',')[0]
  end

    ### this brings out the games descrption from the website
     def game_description
       game = name.gsub(/[ ':]/, '-').downcase

       page = HTTParty.get("https://www.igdb.com/games/#{game}").parsed_response
          parse_page = Nokogiri::HTML(page)

           url = parse_page.css('.charlimit p').text
           if url.length > 300
             url.truncate(299)
           end
      end


end
