require "spec_helper"

describe UserMailer do

  let(:user) { FactoryGirl.create(:user)}

  let(:mail) { UserMailer.send_activation(user) }

  subject { mail }

  it { should have_content("Welcome") }

  it { should have_content(user.email) }

end
