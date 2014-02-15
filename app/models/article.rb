class Article < ActiveRecord::Base
 attr_accessor :title, :subTitle, :content

 belongs_to :profile
end
