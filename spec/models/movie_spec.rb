require 'spec_helper'

describe Movie do
  before(:each) do
    @attr = {
      :name => "Movie Name",
      :published_name => "Published Name",
      :year => "1999",
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

  it "should reject movie with duplicated name in the same year" do
    Movie.create!(@attr)
    movie_with_duplicated_name = Movie.new(@attr.merge(:published_name => ""))
    movie_with_duplicated_name.should_not be_valid
  end

  it "should accept movie with the same name in different years" do
    Movie.create!(@attr)
    movie_with_duplicated_name = Movie.new(@attr.merge(:year => "2000"))
    movie_with_duplicated_name.should be_valid
  end

  it "should reject movie with duplicated published name in the same year" do
    Movie.create!(@attr)
    movie_with_duplicated_published_name = Movie.new(@attr.merge(:name => ""))
    movie_with_duplicated_published_name.should_not be_valid
  end

  it "should accept movie with the same published name in different years" do
    Movie.create!(@attr)
    movie_with_duplicated_published_name = Movie.new(@attr.merge(:year => "2000"))
    movie_with_duplicated_published_name.should be_valid
  end

  it "should reject movie with wrong year format" do
    wrong_year_1 = Movie.new(@attr.merge(:year => "wrong"))
    wrong_year_2 = Movie.new(@attr.merge(:year => "123"))
    wrong_year_3 = Movie.new(@attr.merge(:year => "-1999"))
    [wrong_year_1, wrong_year_2, wrong_year_3].each do |w|
      w.should_not be_valid
    end
  end

  it "should accept movie without year" do
    blank_year = Movie.new(@attr.merge(:year => ""))
    blank_year.should be_valid
  end

  it "should reject movie with wrong imdb score format" do
    wrong_score_1 = Movie.new(@attr.merge(:imdb_score => "wrong"))
    wrong_score_2 = Movie.new(@attr.merge(:imdb_score => "11"))
    wrong_score_3 = Movie.new(@attr.merge(:imdb_score => "-1"))
    wrong_score_4 = Movie.new(@attr.merge(:imdb_score => "1.22"))
    [wrong_score_1, wrong_score_2, wrong_score_3, wrong_score_4].each do |w|
      w.should_not be_valid
    end
  end

  it "should accept movie without imbd score" do
    blank_imdb_score = Movie.new(@attr.merge(:imdb_score => ""))
    blank_imdb_score.should be_valid
  end

  it "should reject movie with wrong runtime format" do
    wrong_runtime_1 = Movie.new(@attr.merge(:runtime => "wrong"))
    wrong_runtime_2 = Movie.new(@attr.merge(:runtime => "1.8"))
    wrong_runtime_3 = Movie.new(@attr.merge(:runtime => "-1"))
    [wrong_runtime_1, wrong_runtime_2, wrong_runtime_3].each do |w|
      w.should_not be_valid
    end
  end

  it "should accept movie without runtime" do
    blank_runtime = Movie.new(@attr.merge(:runtime => ""))
    blank_runtime.should be_valid
  end
end

