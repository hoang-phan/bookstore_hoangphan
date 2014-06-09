require 'spec_helper'

describe User do
  let(:user) { FactoryGirl.create(:user, login_count: 3) }

  specify { expect(user.check_login(user.password)).to eq(false) }
  specify { expect(user.check_login("Wrong")).to eq(true) }

end
