class Company < ActiveRecord::Base
  has_many :freebies
  has_many :devs, through: :freebies

  def give_freebie(dev, item_name, value)
    Freebie.create(item_name: item_name, value: value, dev: dev, company: self)
  end

  def self.oldest_company
    earliest_year = minimum('founding_year')
    find_by(founding_year: earliest_year)
  end
end
