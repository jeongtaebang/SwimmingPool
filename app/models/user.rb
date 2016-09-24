class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :confirmable, :omniauthable, :omniauth_providers => [:facebook, :naver]

  validates_presence_of :name

  # Associations
  has_many :enrollments, dependent: :destroy
  has_many :lectures, through: :enrollments
  has_many :quizzes, dependent: :destroy

  # For omniauthable
  def self.from_omniauth(auth)
  	where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
    	user.email = auth.info.email
    	user.password = Devise.friendly_token[0,20]
    	user.name = auth.info.name   # assuming the user model has a name
    	user.image = auth.info.image # assuming the user model has an image
    	user.skip_confirmation!
  	end
	end

  # Copy data from sessions whenever a user is initialized before signup
	def self.new_with_session(params, session)
    super.tap do |user|
      if data = session["devise.facebook_data"] && session["devise.facebook_data"]["extra"]["raw_info"]
        user.email = data["email"] if user.email.blank?
      end
      if data = session["devise.naver_data"] && session["devise.naver_data"]["extra"]["raw_info"]
        user.email = data["email"] if user.email.blank?
      end
    end
  end
end
