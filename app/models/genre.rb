# == Schema Information
# Schema version: 20110429065750
#
# Table name: genres
#
#  id         :integer         not null, primary key
#  name       :string(255)
#  created_at :datetime
#  updated_at :datetime
#

class Genre < ActiveRecord::Base
  
  has_many :movies
  
  validates :name, :presence => true,
                   :uniqueness => true,
                   :length => { :maximum => 50 }
end
