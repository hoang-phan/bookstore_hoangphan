require 'spec_helper'

describe User do
  let(:user) { FactoryGirl.create(:user, login_count: 3) }
  let(:auth) { {  provider: "mock",
                  uid: "192123",
                  info: { email: "mock@e.com", name: "mock" }
              } }

  context "check login" do
    it "should validate password" do
      expect(user.check_login(user.password)).to eq(false)
    end

    it "should validate password" do
      expect(user.check_login("Wrongpass")).to eq(true)
    end
  end

  context "find for facebook oauth" do
    it "should have correct auth" do
      user = User.find_for_facebook_oauth auth
      user.uid.should eq(auth[:uid])
    end
  end

end
