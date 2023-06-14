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
          street:"Andros Pl",
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
  
      post '/apartments', params: apt_params
      expect(response.status).to eq(200) # Expect a 200 OK status
      json = JSON.parse(response.body)
      expect(json['street'])..to include("can't be blank")
    end

    # Validates that an apartment will not be created without a valid street name
    it 'will not create an apartment listing without a street' do
      apt_params = {
        apartment: {
          street:nil,
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
      post '/apartment', params: apt_params
      # assertion on the response
      # status
      p 'create response', response.status
      expect(response.status).to eq(422)
      # payload
      apartment_json = JSON.parse(response.body)
      expect(apartment_json['name']).to include "can't be blank"
    end
  
end

