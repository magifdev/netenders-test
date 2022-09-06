require 'rails_helper'

RSpec.describe 'User CRUD', type: :model do
  it 'User cant be blank' do
    expect(User.new).to_not be_valid
  end

  it 'User has to have an email' do
    expect(User.new(name: 'Marc', email: nil)).to_not be_valid
  end

  it 'User needs a valid email' do
    expect(User.new(name: 'Marc', email: 'marcgibert91gmail.com')).to_not be_valid
  end

  it 'User is valid with valid attributes' do
    expect(User.new(name: 'Marc', email: 'marcgibert91@gmail.com')).to be_valid
  end

  it 'User can be saved and read' do
    user = User.new(name: 'Marc', email: 'marcgibert91@gmail.com')
    user.save
    expect(user).to eq(User.last)
  end

  it 'User can be updated' do
    user = User.new(name: 'Marc', email: 'marcgibert91@gmail.com')
    user.update(name: 'Paco', email: 'pacogarcia@gmail.com')
    user.save
    expect(user.name).to eq 'Paco'
  end

  it 'User can be deleted' do
    user = User.new(name: 'Marc', email: 'marcgibert91@gmail.com')
    user.save
    user.destroy
    expect(User.last).to_not eq user
  end
end
