class User < ApplicationRecord
  has_and_belongs_to_many :tests, join_table: :tests_users
end
