class Link < ApplicationRecord
    belongs_to :user
    validates :original_url, presence: true
    before_create :generate_short_code
  
    private
  
    def generate_short_code
      self.short_code = SecureRandom.alphanumeric(6)
    end
  
end
