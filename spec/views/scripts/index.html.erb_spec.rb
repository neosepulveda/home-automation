require 'rails_helper'

RSpec.describe "scripts/index", type: :view do
  before(:each) do
    assign(:scripts, [
      Script.create!(
        :name => "Name",
        :code => "MyText",
        :lamp => nil
      ),
      Script.create!(
        :name => "Name",
        :code => "MyText",
        :lamp => nil
      )
    ])
  end

  it "renders a list of scripts" do
    render
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
  end
end
