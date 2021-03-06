class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :interests
  has_many :topics, through: :interests

  def events_of_interest
    Event.for_topics(self.topics.to_a)
  end
end
