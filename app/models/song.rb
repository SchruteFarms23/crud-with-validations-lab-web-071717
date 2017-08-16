class Song < ActiveRecord::Base
  validates :title,:artist_name, presence: true
  # validates :artist_name, uniqueness: true
  validates :release_year, presence: true, unless: :released?
  validate :future_release_year?
  validate :same_artist?

  def released?
    released == false
  end

  def future_release_year?
    if release_year != nil
      if release_year > Date.current.year
      errors.add(:release_year)
    end
    end

  end

  def same_artist?
    Song.all.each do |s|
      if self.title == s.title && self.release_year == s.release_year
        errors.add(:artist,"Cannot be repeated by same artist in same year")
      end
    end
  end
  #
  # validate :less_than_year
  #
  # def less_than_year
  #   if Date.current.year > :release_year
  #     return true
  #   else
  #     return false
  #   end
  # end




end
