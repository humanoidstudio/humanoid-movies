require 'spec_helper'

describe "movies/new.html.haml" do
  before(:each) do
    assign(:movie, stub_model(Movie,
      :name => "MyString",
      :plot => "MyText",
      :imdb_score => 1.5,
      :runtime => 1
    ).as_new_record)
  end

  it "renders new movie form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => movies_path, :method => "post" do
      assert_select "input#movie_name", :name => "movie[name]"
      assert_select "textarea#movie_plot", :name => "movie[plot]"
      assert_select "input#movie_imdb_score", :name => "movie[imdb_score]"
      assert_select "input#movie_runtime", :name => "movie[runtime]"
    end
  end
end
