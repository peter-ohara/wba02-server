class AndroidV1::CourseSerializer < ActiveModel::Serializer
  attribute :id
  attribute :code
  attribute :name
  attribute :level
  attribute :semester
end
