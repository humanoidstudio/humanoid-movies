# == Schema Information
# Schema version: 20110426104017
#
# Table name: movies
#
#  id         :integer         not null, primary key
#  name       :string(255)
#  plot       :text
#  imdb_score :float
#  runtime    :integer
#  created_at :datetime
#  updated_at :datetime
#

class Movie < ActiveRecord::Base
end
