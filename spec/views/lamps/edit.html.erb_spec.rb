require 'rails_helper'

RSpec.describe "lamps/edit", type: :view do
  before(:each) do
    @lamp = assign(:lamp, Lamp.create!(
      :name => "MyString",
      :description => "MyText",
      :calendar => "MyString",
      :status => 1
    ))
  end

  it "renders the edit lamp form" do
    render

    assert_select "form[action=?][method=?]", lamp_path(@lamp), "post" do

      assert_select "input#lamp_name[name=?]", "lamp[name]"

      assert_select "textarea#lamp_description[name=?]", "lamp[description]"

      assert_select "input#lamp_calendar[name=?]", "lamp[calendar]"

      assert_select "input#lamp_status[name=?]", "lamp[status]"
    end
  end
end
