class User < ApplicationRecord
  # Devise modules for authentication and user management
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # Make the User model a rater for ratyrate
  ratyrate_rater

  # Find or create a user by name
  def self.find_or_create_by_name(name)
    user = find_by(full_name: name)

    if user.nil?
      user = create(
        full_name: name,
        email: generate_temp_email,
        password: '123456'  # Use a string for the password
      )
    end

    user
  end

  private

  # Generate a temporary email for the user
  def self.generate_temp_email
    random_string = SecureRandom.hex(8)  # Generate an 8-character random string in hexadecimal format
    domain = 'testemail.com'  # temporary email

    temp_email = "#{random_string}@#{domain}"
    temp_email
  end
end
