require "spec_helper"

describe UserMailer do

  let(:user) { User.new(email: "user@example.com", password: "123456",
                            password_confirmation: "123456", birthday: "11/11/1992",
                            phone: "012223213", full_name: "Hoang Phan Nhat") }

  let(:mail) { UserMailer.welcome_email(user) }

  subject { mail }

  it { should have_content("Welcome") }

  it { should have_content(user.email) }

end
