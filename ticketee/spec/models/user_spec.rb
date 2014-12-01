require 'rails_helper'

RSpec.describe User, :type => :model do
  describe "passwords" do
    it "needs a password and confirmation to save" do
      u = User.new(name: "steve")

      u.save
      expect(u).to_not be_valid

      u.password = "password"
      u.password_confirmation = ""
      u.save
      expect(u).to_not be_valid

      u.password_confirmation = "password"
      u.save
      expect(u).to be_valid
    end

    it "needs password and confirmation to match" do
      u = User.create(name: "steve",
                      password: "hunter2",
                      password_confirmation: "hunter")
      expect(u).to_not be_valid
    end
  end

  describe "authentication" do
    let(:user) { User.create(name: "steve",
                             password: "hunter2",
                             password_confirmation: "hunter2") }

    it "authenticates user with a correct password" do
      expect(user.authenticate("hunter2")).to be
    end

    it "does not authenticate with an incorrect password" do
      expect(user.authenticate("hunter1")).to_not be
    end
  end
end
