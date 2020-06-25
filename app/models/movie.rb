class Movie < ApplicationRecord
      validates :title, {presence: true}
      validates :rating, {presence: true}

      def user
        return User.find_by(id: self.user_id)
      end
end
