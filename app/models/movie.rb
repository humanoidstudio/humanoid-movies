# == Schema Information
# Schema version: 20110427050055
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
#

class Movie < ActiveRecord::Base
  
  validates_presence_of :name, :if => Proc.new { |a| a.published_name.blank? }
  validates_presence_of :published_name, :if => Proc.new { |a| a.name.blank? }
end
