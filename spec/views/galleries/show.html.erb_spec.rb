require 'spec_helper'

describe "galleries/show" do
  before(:each) do
    @gallery = assign(:gallery, stub_model(Gallery,
      :title => "Title",
      :subtitle => "Subtitle",
      :description => "MyText",
      :gallery_type => "Gallery Type"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Title/)
    rendered.should match(/Subtitle/)
    rendered.should match(/MyText/)
    rendered.should match(/Gallery Type/)
  end
end
