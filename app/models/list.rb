class List < ApplicationRecord
  belongs_to :user
  has_many :list_comments, dependent: :destroy
end
