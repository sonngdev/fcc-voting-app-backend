class Poll < ApplicationRecord
  has_many :votes, dependent: :destroy
  belongs_to :user, foreign_key: :created_by
  validates_presence_of :title, :question, :created_by
  accepts_nested_attributes_for :votes, reject_if: proc { |attributes| attributes['name'].blank? }
end
