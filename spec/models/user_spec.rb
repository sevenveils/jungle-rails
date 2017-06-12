require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Validations' do
    it 'should be valid when email, first_name, last_name, password and password confirmation are present' do
      user = User.new(email: 'user@example.com', first_name: 'John', last_name: 'Doe', password: 'password', password_confirmation: 'password')
      expect(user).to be_valid
    end

    it 'should be invalid if email is not present' do
      user = User.new
      expect(user).to_not be_valid
    end

    it 'should be invalid if first name is not present' do
      user = User.new
      expect(user).to_not be_valid
    end

    it 'should be invalid if last name is not present' do
      user = User.new
      expect(user).to_not be_valid
    end

    it 'should be invalid when email address already exists' do
      user1 = User.new(email: 'user@example.com', first_name: 'John', last_name: 'Doe', password: 'password', password_confirmation: 'password')
      user2 = User.new(email: 'user@example.com', first_name: 'John', last_name: 'Doe', password: 'password', password_confirmation: 'password')
      user1.save
      expect(user2).to_not be_valid
    end

    it 'should be valid when email address is case insensitive' do
      user = User.new(email: 'USER@EXAMPLE.COM', first_name: 'John', last_name: 'Doe', password: 'password', password_confirmation: 'password')
      expect(user).to be_valid
    end

    it 'should not be valid without a password' do
      user = User.new(email: 'user@example.com', first_name: 'John', last_name: 'Doe', password: nil, password_confirmation: nil)
      expect(user).to_not be_valid
    end

    it 'should be invalid with a short password' do
      user = User.new password: 's', password_confirmation: 's'
      expect(user).to_not be_valid
    end

    it 'should not be valid with a password confirmation mismatch' do
      user = User.new(email: 'user@example.com', first_name: 'John', last_name: 'Doe', password: 'short', password_confirmation: 'long')
      expect(user).to_not be_valid
    end
  end

  describe '.authenticate_with_credentials' do
    it 'should authenticate if email matches an existing user' do
      user = User.create email: 'user@example.com', first_name: 'John', last_name: 'Doe', password: 'password', password_confirmation: 'password'
      expect(user).to be_valid
    end

    it 'should be valid if email has capital letters' do
      user = User.new(email: 'USER@EXAMPLE.COM', first_name: 'John', last_name: 'Doe', password: 'password', password_confirmation: 'password')
      expect(user).to be_valid
    end

    it 'should not authenticate without a password' do
      user = User.new email: 'user@example.com', first_name: 'John', last_name: 'Doe', password: nil, password_confirmation: nil
      expect(user).to_not be_valid
    end

    it 'should not authenticate with a short password' do
      user = User.new email: 'user@example.com', first_name: 'John', last_name: 'Doe', password: 'short', password_confirmation: 'short'
      expect(user).to_not be_valid
    end

    it 'should not authenticate with a password confirmation mismatch' do
      user = User.new email: 'user@example.com', first_name: 'John', last_name: 'Doe', password: 'pass', password_confirmation: 'password'
      expect(user).to_not be_valid
    end

    it 'should authenticate if there are trailing white spaces in email field' do
      user = User.new email: '  user@example.com ', first_name: 'John', last_name: 'Doe', password: 'password', password_confirmation: 'password'
      expect(user).to be_valid
    end
  end
end
