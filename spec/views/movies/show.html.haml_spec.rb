require 'spec_helper'

describe "movies/show.html.haml" do
  before(:each) do
    @movie = assign(:movie, stub_model(Movie,
      :name => "Name",
      :plot => "MyText",
      :imdb_score => 1.5,
      :runtime => 1
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Name/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/MyText/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1.5/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
  end
end
