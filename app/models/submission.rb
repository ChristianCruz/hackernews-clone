class Submission < ApplicationRecord
  acts_as_votable
  belongs_to :user
  has_many :comments

  scope :with_comments, -> {includes(:comments)}

  # default_scope lets you modify the way submissions are pulled from the database
  default_scope { order('created_at DESC') }
end
