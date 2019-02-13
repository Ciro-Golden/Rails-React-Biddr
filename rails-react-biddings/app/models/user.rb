class User < ApplicationRecord
    has_secure_password
    validates_uniqueness_of :username
    validates :username, :email, uniqueness: true, presence: true

    has_secure_token :auth_token

    has_many :auctions, dependent: :destroy
    has_many :biddings, dependent: :destroy

   

    def invalidate_token
        self.update_columns(auth_token: nil)
    end

    def self.validate_login(username, password)
        user = find_by(username: username)
        if user && user.authenticate(password)
            user
        end
    end
end
