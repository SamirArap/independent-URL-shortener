class Url < ApplicationRecord

  validates_format_of :original_url, with: URI::regexp(%w(http https))
  after_create :generate_shortId

  ENV['BASE_URL']='http://localhost:3000/'

  def display_url
    ENV['BASE_URL'] + self.short_id
  end

  def show_url
    ENV['BASE_URL'] + self.short_id
  end


  def generate_shortId
    self.short_id = SecureRandom.hex(3)
    self.save
  end
end
