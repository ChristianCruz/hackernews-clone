class Submission < ApplicationRecord
  acts_as_votable
  belongs_to :user
  has_many :comments

  scope :with_comments, -> {includes(:comments)}
end
