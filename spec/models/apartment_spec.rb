require 'rails_helper'

RSpec.describe Apartment, type: :model do
  let(:user) { User.create(
    email: 'test@example.com',
    password: 'password',
    password_confirmation: 'password'
    )
  }

  it 'should validate street' do
    apartment = user.apartments.create(
      unit: '2A',
      city: 'Little Whinging',
      state: 'Surrey',
      square_footage: 2000,
      price: '2000',
      bedrooms: 3,
      bathrooms: 2,
      pets: 'yes',
      image: 'https://c8.alamy.com/comp/B0RJGE/small-bungalow-home-with-pathway-in-addlestone-surrey-uk-B0RJGE.jpg'
    )
    expect(apartment.errors[:street]).to_not be_empty
  end
    it 'should validate state' do
      apartment = user.apartments.create(
        street: 'Astros St',
        unit: '2A',
        city: 'Little Whinging',
        state: nil,
        square_footage: 2000,
        price: '2000',
        bedrooms: 3,
        bathrooms: 2,
        pets: 'yes',
        image: 'https://c8.alamy.com/comp/B0RJGE/small-bungalow-home-with-pathway-in-addlestone-surrey-uk-B0RJGE.jpg'
      )
      expect(apartment.errors[:state]).to_not be_empty
    end
    it 'should validate city' do
      apartment = user.apartments.create(
        street: 'Astros St',
        unit: '2A',
        city: nil,
        state: 'Surrey',
        square_footage: 2000,
        price: '2000',
        bedrooms: 3,
        bathrooms: 2,
        pets: 'yes',
        image: 'https://c8.alamy.com/comp/B0RJGE/small-bungalow-home-with-pathway-in-addlestone-surrey-uk-B0RJGE.jpg'
      )
      expect(apartment.errors[:city]).to_not be_empty
    end

    it 'should validate price' do
      apartment = user.apartments.create(
        street: 'Astros St',
        unit: '2A',
        city: 'Little Whinging',
        state: 'Surrey',
        square_footage: 2000,
        price: nil,
        bedrooms: 3,
        bathrooms: 2,
        pets: 'yes',
        image: 'https://c8.alamy.com/comp/B0RJGE/small-bungalow-home-with-pathway-in-addlestone-surrey-uk-B0RJGE.jpg'
      )
      expect(apartment.errors[:price]).to_not be_empty
    end
  
end 