class Post < ActiveRecord::Base

  validates :console, presence: true
  validates :gamertag, presence: true
  validates :game, presence: true
  validates :description, presence: true
  validates :language, presence: true
  validates :microphone, inclusion: [true, false]
  validate :gamertag_truth

  def gamertag_truth
    if self.console == "Xbox One" || self.console == "Xbox 360"
      response = HTTParty.get("https://xboxapi.com/v2/xuid/#{gamertag}", headers: {"X-AUTH" => "5e01be3ebd93462725708476959178793fe02b2e"}).parsed_response
        if response["success"] == false
          errors.add(:gamertag, "is not valid")
        end
    end
  end
end
