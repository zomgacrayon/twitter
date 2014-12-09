class Tweet < ActiveRecord::Base
  # Remember to create a migration!
  validates :post, length: { maximum: 140 }
  belongs_to :user
end
