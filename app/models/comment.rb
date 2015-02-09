class Comment < ActiveRecord::Base
  belongs_to :article

  validates :author, presence: true
  validates :body, presence: true
end
