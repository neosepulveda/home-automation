require 'rails_helper'

RSpec.describe "scripts/show", type: :view do
  before(:each) do
    @script = assign(:script, Script.create!(
      :name => "Name",
      :code => "MyText",
      :lamp => nil
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(//)
  end
end
