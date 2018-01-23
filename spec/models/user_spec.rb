require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Validations' do
    it 'saves a user' do
      user = User.new(first_name: 'a', last_name: 'a', email:'a@a.com', password: 'a', password_confirmation: 'a')
      expect(user).to be_valid
    end

    it 'does not save user when password and password confirmation do not match' do
      user = User.new(first_name: 'a', last_name: 'a', email:'a@a.com', password: 'a', password_confirmation: 'b')
      expect(user).to_not be_valid
    end

    it 'does not save user when email is not unique' do
      @user1 = User.create(first_name: 'a', last_name: 'a', email:'A@a.com', password: 'a', password_confirmation: 'a')
      @user2 = User.create(first_name: 'a', last_name: 'a', email:'a@a.com', password: 'a', password_confirmation: 'a')
      expect(@user2).to_not be_valid
    end

    it 'does not save user when password is not long enough' do
      @user = User.create(first_name: 'a', last_name: 'a', email:'a@a.com', password: '', password_confirmation: '')
      expect(@user.errors[:password]).to include("is too short (minimum is 1 character)")
    end
  end

  describe '.authenticate_with_credentials' do
    it 'will return a user when given correct credentials' do
      @user = User.create(first_name: 'a', last_name: 'a', email:'a@a.com', password: 'a', password_confirmation: 'a')
      expect(User.authenticate_with_credentials("a@a.com", "a")).to eq(@user)
    end

    it 'will return nil when given incorrect credentials' do
      @user = User.create(first_name: 'a', last_name: 'a', email:'a@a.com', password: 'a', password_confirmation: 'a')
      expect(User.authenticate_with_credentials("a@a.com", "b")).to be_nil
    end

    it 'will return a user when given correct credentials with spaces in the email' do
      @user = User.create(first_name: 'a', last_name: 'a', email:'a@a.com', password: 'a', password_confirmation: 'a')
      expect(User.authenticate_with_credentials("    a@a.com   ", "a")).to eq(@user)
    end

    it 'will return a user when given correct credentials with random capitalization in the email' do
      @user = User.create(first_name: 'a', last_name: 'a', email:'a@a.com', password: 'a', password_confirmation: 'a')
      expect(User.authenticate_with_credentials("A@a.CoM", "a")).to eq(@user)
    end

  end
end
