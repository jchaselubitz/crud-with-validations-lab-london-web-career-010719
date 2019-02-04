class Song < ActiveRecord::Base
    validates :title, presence: true
    validates :title, uniqueness: true
    validates :release_year, presence: true, if: :released?
    validates :release_year, presence: false, unless: :released?
    validate :is_in_the_past
    validates :released, inclusion: {in: [true, false]}
    validates :artist_name, presence: true

    def is_in_the_past
        if released? && release_year == nil
            return errors.add(:release_year, "Year must be set")
        end
        if released? && release_year > Date.today.year
            return errors.add(:release_year, "Year must be in the past")
        end
        if !released? && release_year != nil
            return errors.add(:release_year, "Year cannot be set is song is not released")
        end
    end

    def released?
        self.released
    end

  
end
