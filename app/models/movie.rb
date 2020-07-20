class Movie < ApplicationRecord
  has_many :likes, dependent: :destroy

  validates :url, presence: true
  before_save :fetch_details

  def fetch_details
    video = Yt::Video.new url: self.url
    self.title = video.title
    self.description = video.description
  end
end
