class AndroidV1::UserSerializer < ActiveModel::Serializer

  attribute :id
  attribute :display_name
  attribute :email
  attribute :profile_url
  attribute :auth_token
  attribute :pasco_credits

  has_many :quizzes
end
