class AbstractCredential < ActiveRecord::Base
 attr_accessor :profile
 has_one :profile
end
