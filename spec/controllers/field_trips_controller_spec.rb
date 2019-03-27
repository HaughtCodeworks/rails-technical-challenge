require 'rails_helper'

RSpec.describe FieldTripsController, type: :request do
  before { @field_trip = create(:field_trip) }

  describe 'GET #index' do
    it 'is successful' do
      get field_trips_url
      expect(response).to be_successful
    end
  end

  describe 'GET #new' do
    it 'is successful' do
      get new_field_trip_url
      expect(response).to be_successful
    end
  end

  describe 'POST #create' do
    it 'creates a new FieldTrip record' do
      expect {
        post field_trips_url, params: { field_trip: { name: 'Test' } }
      }.to change(FieldTrip, :count).by(1)
    end

    it 'redirects to the show screen for the newly-created FieldTrip' do
      post field_trips_url, params: { field_trip: { name: 'Test' } }
      expect(response).to redirect_to(field_trip_url(FieldTrip.last))
    end
  end

  describe 'GET #show' do
    it 'is successful' do
      get field_trip_url(@field_trip)
      expect(response).to be_successful
    end
  end

  describe 'GET #edit' do
    it 'is successful' do
      get edit_field_trip_url(@field_trip)
      expect(response).to be_successful
    end
  end

  describe 'PATCH #update' do
    it 'updates the given record' do
      patch field_trip_url(@field_trip),
        params: { field_trip: { name: 'Elsewhere' } }
      expect(@field_trip.reload.name).to eq 'Elsewhere'
    end

    it 'redirects to the show screen for the FieldTrip' do
      patch field_trip_url(@field_trip),
        params: { field_trip: { name: 'Elsewhere' } }

      expect(response).to redirect_to(field_trip_url(@field_trip))
    end
  end

  describe 'DELETE #destroy' do
    it 'deletes the record' do
      expect {
        delete field_trip_url(@field_trip)
      }.to change(FieldTrip, :count).by(-1)
    end

    it 'redirects to the index screen for FieldTrips' do
      delete field_trip_url(@field_trip)
      expect(response).to redirect_to(field_trips_url)
    end
  end
end

