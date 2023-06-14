require 'rails_helper'

RSpec.describe "Apartments", type: :request do
  let(:user) { User.create(
    email: 'test@example.com',
    password: 'password',
    password_confirmation: 'password'
    )
  }
  describe "GET /index" do
    it 'return a list of apartments' do
      apartment = user.apartments.create(
        street:"Andros Pl",
        unit:"1",
        city:"San Diego",
        state:"CA",
        square_footage:1200,
        price:"2,500",
        bedrooms:2,
        bathrooms:2,
        pets:"yes",
        image:"../assets/images/apartment.jpeg"
      )
      get '/apartments'

      apartment = JSON.parse(response.body)
      expect(response).to have_http_status(200)
      expect(apartment.first['street']).to eq('Andros Pl')
    end
  end
  describe "POST /create" do
    it "creates an apartment listing" do
      apt_params = {
        apartment: {
          street:"Astros St",
          unit:"1",
          city:"San Francisco",
          state:"CA",
          square_footage:1200,
          price:"2,500",
          bedrooms:2,
          bathrooms:2,
          pets:"yes",
          image:"../assets/images/apartment.jpeg",
          user_id: user.id
        }
      }
  
      post '/apartments', params: apt_params

      json = JSON.parse(response.body)
      expect(json['street']).to eq "Astros St"
    end

    # Validates that an apartment will not be created without a valid street name
    it 'will not create an apartment listing without a street' do
      apt_params = {
        apartment: {
          unit:"1",
          city:"San Diego",
          state:"CA",
          square_footage:1200,
          price:"2,500",
          bedrooms:2,
          bathrooms:2,
          pets:"yes",
          image:"../assets/images/apartment.jpeg",
          user_id: user.id
        }
      }
      #request
      post '/apartments', params: apt_params
      error_response = JSON.parse(response.body)
      expect(error_response['street']).to include "can't be blank"
      expect(response).to have_http_status(422)
    end

    it 'will not create an apartment listing without a state' do
      apt_params = {
        apartment: {
          street: "Astros St",
          unit:"1",
          city:"San Diego",
          square_footage:1200,
          price:"2,500",
          bedrooms:2,
          bathrooms:2,
          pets:"yes",
          image:"../assets/images/apartment.jpeg",
          user_id: user.id
        }
      }
      #request
      post '/apartments', params: apt_params
      error_response = JSON.parse(response.body)
      expect(error_response['state']).to include "can't be blank"
      expect(response).to have_http_status(422)
    end

    it 'will not create an apartment listing without a city' do
      apt_params = {
        apartment: {
          street: "Astros St",
          unit:"1",
          state:"CA",
          square_footage:1200,
          price:"2,500",
          bedrooms:2,
          bathrooms:2,
          pets:"yes",
          image:"../assets/images/apartment.jpeg",
          user_id: user.id
        }
      }
      #request
      post '/apartments', params: apt_params
      error_response = JSON.parse(response.body)
      expect(error_response['city']).to include "can't be blank"
      expect(response).to have_http_status(422)
    end

    it 'will not create an apartment listing without a price' do
      apt_params = {
        apartment: {
          street: "Astros St",
          unit:"1",
          city:"San Diego",
          state:"CA",
          square_footage:1200,
          bedrooms:2,
          bathrooms:2,
          pets:"yes",
          image:"../assets/images/apartment.jpeg",
          user_id: user.id
        }
      }
      #request
      post '/apartments', params: apt_params
      error_response = JSON.parse(response.body)
      expect(error_response['price']).to include "can't be blank"
      expect(response).to have_http_status(422)
    end
  end
end

