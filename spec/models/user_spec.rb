require 'spec_helper'

describe User do
	before do
		@user = User.new(username: "Example User", password:"foobar", password_confirmation: "foobar")
	end

	subject {@user}

	it { should respond_to(:username) }
	it { should respond_to(:password) }
	it { should respond_to(:password_confirmation) }

	it { should be_valid }

	describe "when username is not present" do
		before { @user.username = " " }
		it { should_not be_valid }
  end

  describe "when username is too long" do
  	before { @user.username = "a" * 51 }
  	it { should_not be_valid }
  end

  describe "when password is not present" do
  	before do
  		@user = User.new(username: "Example User", password: " ", password_confirmation: " ")
  	end
  	it { should_not be_valid }
  end

	describe "when password doesn't match confirmation" do
		before { @user.password_confirmation = "mismatch" }
		it { should_not be_valid }
	end

	describe "when password confirmation is nil" do
		before do
			@user = User.new(username: "Example User", password: "foobar", password_confirmation: nil)
		end
		it { should_not be_valid }
	end

	describe "with a password that's too short" do
		before { @user.password = @user.password_confirmation = "a" * 5 }
		it { should_not be_valid }
	end

end
