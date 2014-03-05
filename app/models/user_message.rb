class UserMessage < ActiveRecord::Base
attr_accessor :sender_id, :recipient_id, :content, :read_status
before_save do |msg|
msg.read_status = false
end

end
