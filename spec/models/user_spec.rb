require "spec_helper"

describe User do

  before (:each) do
    @user = FactoryGirl.create(:user)
  end

  it { should have_many(:projects).through(:invites) }

  it "should require password" do
    @user.should be_valid
  end

  it "should not valid without password" do
    @user = User.new(:email => "test@test.ru",:password =>"")
    @user.should_not be_valid
  end

  it "should be saved with valid data" do
    lambda{
      User.create!(:email => "test2@test.ru", :password => "123456", :password_confirmation => "123456")
    }.should change{User.count}.by 1
  end

end