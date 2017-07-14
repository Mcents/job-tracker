class Contact < ApplicationRecord
  belongs_to :company
  validates :email, presence: true, uniqueness: true
  validates :title, presence: true
  validates :name, presence: true
end
