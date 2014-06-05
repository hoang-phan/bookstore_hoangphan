require 'spec_helper'

describe "ActivationPages" do

  describe "activation" do

    let(:user) { FactoryGirl.create(:user) }

    subject { page }
    before { visit activation_url(user.activation_token) }

    it { should have_selector("div.alert.alert-success") }
  end
end
