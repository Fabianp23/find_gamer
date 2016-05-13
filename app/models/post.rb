class Post < ActiveRecord::Base

  validates :console, presence: true
  validates :gamertag, presence: true
  validates :game, presence: true
  validates :description, presence: true
  validates :language, presence: true
  validates :microphone, inclusion: [true, false]

end
