class Link < ApplicationRecord
  validates_presence_of :url
  before_create :generate_slug

  def generate_slug
    self.slug = loop do
      random_token = SecureRandom.urlsafe_base64(nil, false)
      break random_token unless self.class.exists?(slug: random_token)
    end
  end
end
