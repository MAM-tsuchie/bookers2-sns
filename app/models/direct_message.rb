class DirectMessage < ApplicationRecord

  scope :messages_with_the_user, -> (current_user,user){
    where(sender: user,receiver: current_user).or(where(receiver: user, sender: current_user))
  }
  belongs_to :sender, class_name: "User"
  belongs_to :receiver, class_name: "User"
end
