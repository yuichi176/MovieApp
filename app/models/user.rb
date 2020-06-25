class User < ApplicationRecord
    validates :name, {presence: true}
    validates :email, {presence: true, uniqueness: true}
    validates :user_id, {presence: true}

    def movies
      return Movie.where(user_id: self.id)
    end
end
