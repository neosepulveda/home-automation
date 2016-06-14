require 'rails_helper'

RSpec.describe "lamps/show", type: :view do
  before(:each) do
    @lamp = assign(:lamp, Lamp.create!(
      :name => "Name",
      :description => "MyText",
      :calendar => "Calendar",
      :status => 1
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/Calendar/)
    expect(rendered).to match(/1/)
  end
end
