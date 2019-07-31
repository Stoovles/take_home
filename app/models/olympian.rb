class Olympian < ApplicationRecord


  def total_medals_won
    Olympian.where(name: self.name).where.not(medal: "NA").count
  end

  def self.youngest
    where(age: minimum(:age))
  end

  def self.oldest
    where(age: maximum(:age))
  end

  def self.total_olympians
    Olympian.select(:name).distinct.count
  end

  def self.average_age
    Olympian.select('distinct on (name) *').average(:age).round(1)
  end

  def self.male_average_weight
    Olympian.select('distinct on (name) *').where(sex: "M").average(:weight).round(1)
  end

  def self.female_average_weight
    Olympian.select('distinct on (name) *').where(sex: "F").average(:weight).round(1)
  end

end
