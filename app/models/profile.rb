class Profile < ActiveRecord::Base
 attr_accessor :firstName, :lastName, :sex, :dob, :location, :bio

 has_many :articles
 has_one :credential

 #we need to have all attributes except bio.
 validates :firstName, presence: true
 validates :lastName. presence: true
 validates :sex, presence: true, inclusion: {in: %w{male, female}, message: "%{value} is not a sex option"}
 validates :dob, presence: true
end
