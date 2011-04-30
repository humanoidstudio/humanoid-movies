require 'spec_helper'

describe Genre do
  
  before(:each) do
    @attr = { :name => "Genre Name" }
  end
  
  it "should create a new instance given valid atributes" do
    Genre.create!(@attr)
  end
  
  it "should require a name" do
    no_name_genre = Genre.new(:name => "")
    no_name_genre.should_not be_valid
  end
  
  it "should reject a duplicate name" do
    Genre.create!(@attr)
    duplicated_genre = Genre.new(@attr)
    duplicated_genre.should_not be_valid
  end
  
  it "should reject long name" do
    string = "a" * 51
    long_name_genre = Genre.new(:name => string)
    long_name_genre.should_not be_valid
  end
  
  describe "movie association" do
    
    before(:each) do
      @genre = Genre.create!(@attr)
    end
    
    it "should have a movies attribute" do
      @genre.should respond_to(:movies)
    end    
  end

end
