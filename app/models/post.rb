class Post < ActiveRecord::Base
  belongs_to :game

  validates :console, presence: true
  validates :gamertag, presence: true
  validates :game_id, presence: true
  validates :description, presence: true
  validates :language, presence: true
  validates :microphone, inclusion: [true, false]
  validate  :gamertag_truth

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

end
