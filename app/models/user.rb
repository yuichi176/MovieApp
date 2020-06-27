class User < ApplicationRecord
    has_secure_password
    validates :name, {presence: true}
    validates :email, {presence: true, uniqueness: true}

    def movies
      return Movie.where(user_id: self.id)
    end

    def inclement_count_movie
      self.sum_movies += 1
      self.save
    end

    def declement_count_movie
      self.sum_movies -= 1
      self.save
    end

end
