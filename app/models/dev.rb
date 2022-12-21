class Dev < ActiveRecord::Base
  has_many :freebies
  has_many :companies, through: :freebies

  def received_one?(item_name)
    freebies.each { |f| return true if f.item_name == item_name }
    false
  end

  def give_away(dev, freebie)
    return unless received_one?(freebie.item_name)

    freebie.dev = dev
    freebie.save
  end
end
