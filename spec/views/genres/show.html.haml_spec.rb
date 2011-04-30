require 'spec_helper'

describe "genres/show.html.haml" do
  before(:each) do
    @genre = assign(:genre, stub_model(Genre,
      :name => "Name"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Name/)
  end
end
