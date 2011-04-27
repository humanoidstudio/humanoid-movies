require 'spec_helper'

describe Movie do
  before(:each) do
    @attr = { 
      :name => "Movie Name",
      :published_name => "Published Name",
      :plot => "Movie Plot",
      :imdb_score => "9.2",
      :runtime => "142"
    }
  end
  
  it "should create a new instance given valid attributes" do
    Movie.create!(@attr)
  end
  
  it "should require a name or a published name" do
    movie_without_name = Movie.new(@attr.merge(:name => "", 
                                               :published_name => ""))
    movie_without_name.should_not be_valid
  end
  
  it "should accept movie with a name but without a published name" do
    movie_with_name = Movie.new(@attr.merge(:published_name => ""))
    movie_with_name.should be_valid
  end
  
  it "should accept movie with a published name but without a name" do
    movie_with_published_name = Movie.new(@attr.merge(:name => ""))
    movie_with_published_name.should be_valid
  end
  
  it "should accept movie with both names" do
    movie_with_both_names = Movie.new(@attr)
    movie_with_both_names.should be_valid
  end
end
