class Post < ActiveRecord::Base
  belongs_to :game

  validates :console, presence: true
  validates :gamertag, presence: true
  validates :game_id, presence: true
  validates :description, presence: true
  validates :language, presence: true
  validates :microphone, inclusion: [true, false]
  validate :gamertag_truth

  def gamertag_truth
    if self.console == "Xbox One" || self.console == "Xbox 360"
      response = HTTParty.get("https://xboxapi.com/v2/xuid/#{gamertag}", headers: {"X-AUTH" => ENV["XBOX_TOKEN"]}).parsed_response
      if response["success"] == false
        errors.add(:gamertag, "is not valid")
      end
    elsif self.console == "PlayStation 4" || self.console == "PlayStation 3"
      page = HTTParty.get("https://my.playstation.com/#{gamertag}")
      parse_page = Nokogiri::HTML(page)
      if  parse_page.css('.user-info h2').text == ""
        errors.add(:gamertag, "is not valid")
      end
    end
  end

  def games_picture
    game = game.gsub(/[ ':]/, '-')
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
      end

    page = HTTParty.get("https://www.igdb.com/games/#{game}").parsed_response
       parse_page = Nokogiri::HTML(page)

       url = "https:" + parse_page.css('.inline-block img')[0]['srcset']
      url =  url.split(',')
   end


end
