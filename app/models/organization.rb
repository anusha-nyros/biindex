class Organization < ActiveRecord::Base
  attr_accessible :name
  validates_presence_of :name
  has_many :users, dependent: :destroy
  has_many :reports, dependent: :destroy
end
