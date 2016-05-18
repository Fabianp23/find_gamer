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
      response = HTTParty.get("https://xboxapi.com/v2/xuid/#{gamertag}", headers: {"X-AUTH" => ENV["XBOX_TOKEN"]}).parsed_response
        if response["success"] == false
          errors.add(:gamertag, "is not valid")
        end
    end
  end
end
