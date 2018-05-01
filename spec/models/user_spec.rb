require 'rails_helper'

RSpec.describe User, type: :model do
  subject {
    described_class.new(name: "Greg", email: 'greg@greg.com', password: "password", password_confirmation: "password")
  }

  describe 'Validations' do
    it "is valid with valid credentials" do
      expect(subject).to be_valid
    end

    it "is not valid without a password" do
      subject.password = nil
      expect(subject).to_not be_valid
    end

    it "is not valid without a password_confirmation" do
      subject.password_confirmation = nil
      expect(subject).to_not be_valid
    end

    it "is not valid if password does not equal password_confirmation" do
      subject.password_confirmation = "notpassword"
      expect(subject).to_not be_valid
    end

    it "is not valid without password and password_confirmation" do
      subject.password = nil
      subject.password_confirmation = nil
      expect(subject).to_not be_valid
    end

    it "is not valid if email already exists" do
      User.create!(name: "Bob", email: 'greg@greg.com', password: "password", password_confirmation: "password")
      expect(subject).to_not be_valid
    end

    it "is not valid if email exits with case-sensitive" do
      User.create!(name: "Bob", email: 'greG@gReG.COm', password: "password", password_confirmation: "password")
      expect(subject).to_not be_valid
    end

    it "is not valid without email" do
      subject.email = nil
      expect(subject).to_not be_valid
    end

    it "is not valid without name" do
      subject.name = nil
      expect(subject).to_not be_valid
    end

    it "is not valid if password length < 6" do
      subject.password = "pass"
      expect(subject).to_not be_valid
    end
  end

  describe '.authenticate_with_credentials' do

    it "is not nil if email and password are authenticated" do
      subject.save
      expect(User.authenticate_with_credentials("greg@greg.com", "password")).to_not be nil
    end

    it "is nil if no email" do
      subject.save
      expect(User.authenticate_with_credentials("", "password")).to be nil
    end

    it "is nil if no password" do
      subject.save
      expect(User.authenticate_with_credentials("greg@greg.com", "")).to be nil
    end

    it "is nil if wrong password" do
      subject.save
      expect(User.authenticate_with_credentials("greg@greg.com", "passwor")).to be nil
    end

    it "is not nil if email has whitespace in front or back" do
      subject.save
      expect(User.authenticate_with_credentials(" greg@greg.com   ", "password")).to_not be nil
    end

    it "is not nil if email has upper case letters" do
      subject.save
      expect(User.authenticate_with_credentials("Greg@Greg.com", "password")).to_not be nil
    end

    it "is not nil if email has upper case letters and whitespaces" do
      subject.save
      expect(User.authenticate_with_credentials("  Greg@Greg.com    ", "password")).to_not be nil
    end
  end
end
