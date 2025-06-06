require_relative '../model/user'

module UserCtl
  def self.register_user(user)
    user.save!
  end
end
