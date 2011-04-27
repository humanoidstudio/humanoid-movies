# == Schema Information
# Schema version: 20110427083847
#
# Table name: movies
#
#  id             :integer         not null, primary key
#  name           :string(255)
#  plot           :text
#  imdb_score     :float
#  runtime        :integer
#  created_at     :datetime
#  updated_at     :datetime
#  published_name :string(255)
#  year           :integer
#

class Movie < ActiveRecord::Base
  
  validates_presence_of   :name, :if => Proc.new { |a| a.published_name.blank? }
  validates_presence_of   :published_name, :if => Proc.new { |a| a.name.blank? }
  validates_uniqueness_of :name, :scope => :year
  validates_uniqueness_of :published_name, :scope => :year
  validates_format_of     :year, :with => /^\d{4}$/, :allow_blank => true
  validates_format_of     :imdb_score, :with => /^\d{1,2}(\.[0-9])?$/
end
