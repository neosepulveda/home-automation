require 'rails_helper'

RSpec.describe "scripts/edit", type: :view do
  before(:each) do
    @script = assign(:script, Script.create!(
      :name => "MyString",
      :code => "MyText",
      :lamp => nil
    ))
  end

  it "renders the edit script form" do
    render

    assert_select "form[action=?][method=?]", script_path(@script), "post" do

      assert_select "input#script_name[name=?]", "script[name]"

      assert_select "textarea#script_code[name=?]", "script[code]"

      assert_select "input#script_lamp_id[name=?]", "script[lamp_id]"
    end
  end
end
