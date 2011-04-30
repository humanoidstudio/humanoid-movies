require 'spec_helper'

describe "genres/index.html.haml" do
  before(:each) do
    assign(:genres, [
      stub_model(Genre,
        :name => "Name"
      ),
      stub_model(Genre,
        :name => "Name"
      )
    ])
  end

  it "renders a list of genres" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Name".to_s, :count => 2
  end
end
