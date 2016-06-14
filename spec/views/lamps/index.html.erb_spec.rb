require 'rails_helper'

RSpec.describe "lamps/index", type: :view do
  before(:each) do
    assign(:lamps, [
      Lamp.create!(
        :name => "Name",
        :description => "MyText",
        :calendar => "Calendar",
        :status => 1
      ),
      Lamp.create!(
        :name => "Name",
        :description => "MyText",
        :calendar => "Calendar",
        :status => 1
      )
    ])
  end

  it "renders a list of lamps" do
    render
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "Calendar".to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
  end
end
