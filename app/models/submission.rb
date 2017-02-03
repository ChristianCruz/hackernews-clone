class Submission < ApplicationRecord
  acts_as_votable
  belongs_to :user
  has_many :comments, dependent: :destroy

  scope :with_comments, -> {includes(:comments)}

  # default_scope lets you modify the way submissions are pulled from the database
  default_scope { order('created_at DESC') }

  validates :title, length: { minimum: 5 }, presence: true
  validates :user, presence: true
end
