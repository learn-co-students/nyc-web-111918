class User < ApplicationRecord
  has_secure_password

  # def password_digest
  #   @password_digest
  # end

  #pt_pw = plainttext_passwrod
  # def password=(pt_pw)
  #   self.password_digest = BCrypt::Password.create(pt_pw)
  # end
  #
  # def password
  #   @password
  # end
  #
  # def authenticate(pt_pw) # 'goat'
  #   # compare an already existing user's plaintext_pw against the salted and hashed version we have in the db
  #   BCrypt::Password.new(self.password_digest) == pt_pw
  # end


end
