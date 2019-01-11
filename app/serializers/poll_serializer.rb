class PollSerializer < ActiveModel::Serializer
  attributes :id, :title, :question, :created_by
  has_many :votes
end
