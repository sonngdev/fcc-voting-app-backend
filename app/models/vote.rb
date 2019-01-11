class Vote < ApplicationRecord
  belongs_to :poll
  validates_presence_of :name, :poll_id, :times
end
