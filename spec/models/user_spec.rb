require 'spec_helper'

describe User do
 it "Organization first user should be assigned as Admin"
 it "should have atleast 1 manager assigned except Admin & HR"
 context "When editing and updating profile"
  it "Should have name"
  it "Should have local address"
  it "Should have permanent address"
  context "Should  have PAN number" do
   it "Should be visible to admin, HR and for that user itself"
  end
  it  "Should have Github handle "
  it "Should have twitter handle"
  it "Should have phone number"
  it "Should havve date of birth"
  it "Should mention date of joining"
  it "Should mention employee id"
  it "Should have passport number"
 end
end
