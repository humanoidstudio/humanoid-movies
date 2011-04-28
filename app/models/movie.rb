# == Schema Information
# Schema version: 20110428155926
#
# Table name: movies
#
#  id             :integer         not null, primary key
#  name           :string(255)
#  plot           :text
#  imdb_score     :decimal(, )
#  runtime        :integer
#  created_at     :datetime
#  updated_at     :datetime
#  published_name :string(255)
#  year           :integer
#

class Movie < ActiveRecord::Base

  validates :name,
            :presence => { :if => Proc.new { |a| a.published_name.blank? } },
            :uniqueness => { :scope => :year }
  validates :published_name,
            :presence => { :if => Proc.new { |a| a.name.blank? } },
            :uniqueness => { :scope => :year }
  validates :year,
            :numericality => { :only_integer => true,
                               :greater_than_or_equal_to => 1888,
                               :less_than_or_equal_to => 2099 },
            :allow_blank => true
  validates :imdb_score,
            :numericality => { :greater_than_or_equal_to => 0.0,
                               :less_than_or_equal_to => 10.0 },
            :allow_blank => true
  validates :runtime,
            :numericality => { :only_integer => true,
                               :greater_than => 0 },
            :allow_blank => true

end

