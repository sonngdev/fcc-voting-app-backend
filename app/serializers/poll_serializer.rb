class PollSerializer < ActiveModel::Serializer
  attributes :id, :title, :question
  has_many :votes
end
