require 'spec_helper'

describe User do
  before { @user = User.new(email: "user@example.com", password: "123456",
                            password_confirmation: "123456", birthday: "11/11/1992",
                            phone: "012223213", full_name: "Hoang Phan Nhat") }

  subject { @user }

  it { should respond_to(:email) }
  it { should respond_to(:password) }
  it { should respond_to(:password_digest) }
  it { should respond_to(:password_confirmation) }
  it { should respond_to(:full_name) }
  it { should respond_to(:phone) }
  it { should respond_to(:birthday) }
  it { should respond_to(:created_at) }
  it { should respond_to(:activated) }
  it { should respond_to(:activation_token) }
  it { should respond_to(:remember_token) }
  it { should respond_to(:login_count) }
  it { should respond_to(:last_login_at) }

  it { should be_valid }
  it { should_not be_activated }

  describe "is activated" do
    before do
      @user.save!
      @user.toggle!(:activated)
    end

    it { should be_activated }
  end

  describe "with blank email" do
    before { @user.email = " " }
    it { should_not be_valid }
  end

  describe "when email format is invalid" do
    it "should be invalid" do
      addresses = %w[user@foo,com user_at_foo.org example.user@foo.
                     foo@bar_baz.com foo@bar+baz.com]
      addresses.each do |invalid_address|
        @user.email = invalid_address
        expect(@user).not_to be_valid
      end
    end
  end

  describe "when email format is valid" do
    it "should be valid" do
      addresses = %w[user@foo.COM A_US-ER@f.b.org frst.lst@foo.jp a+b@baz.cn]
      addresses.each do |valid_address|
        @user.email = valid_address
        expect(@user).to be_valid
      end
    end
  end

  describe "when birthday format is invalid" do
    before { @user.birthday = "11/14/2011" }
    it { should_not be_valid}
  end

  describe "when email address is duplicate" do
    before do
      user_with_same_email = @user.dup
      user_with_same_email.email = @user.email.upcase
      user_with_same_email.save
    end

    it { should_not be_valid }
  end

  describe "when password is too short" do
    before { @user.password = 'aaaaa' }

    it { should_not be_valid }
  end

  describe "return value of authenticate method" do
    before { @user.save }
    let(:found_user) { User.find_by(email: @user.email) }

    describe "with valid password" do
      it { should eq found_user.authenticate(@user.password) }
    end

    describe "with invalid password" do
      let(:user_for_invalid_password) { found_user.authenticate("invalid") }

      it { should_not eq user_for_invalid_password }
      specify { expect(user_for_invalid_password).to be_false }
    end
  end

  describe "remember token" do
    before { @user.save }
    its(:remember_token) { should_not be_blank }
  end
end

