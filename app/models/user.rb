class User < ApplicationRecord
  has_many :created_tests, class_name: 'Test', foreign_key: 'author_id', dependent: :destroy
  has_many :test_users
  has_many :tests, through: :test_users, dependent: :destroy

  def find_test_by_level(level)
    Test.joins('JOIN test_users ON tests.id = test_users.test_id').where('test_users.user_id = :id AND tests.level = :level', id: self.id, level: level).pluck(:title)
  end

  validates :email, presence: true
end
