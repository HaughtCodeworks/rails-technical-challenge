require 'rails_helper'

RSpec.feature 'Organizing a Field Trip' do
  scenario 'Visiting the Index' do
    create(:field_trip, name:  'Trip to UC Boulder')

    visit field_trips_url

    expect(page).to have_content 'Field Trips'
    expect(page).to have_content 'Trip to UC Boulder'
  end

  scenario 'Creating a Field Trip' do
    visit new_field_trip_path

    fill_in :field_trip_name, with: 'Denver Aquarium 2019 Senior Trip'
    click_on t('helpers.submit.create', model: 'Field trip')

    expect(page).to have_content 'Denver Aquarium 2019 Senior Trip'
    expect(page).to have_content 'Field trip was successfully created'

    click_on 'Back'
    expect(current_path).to eq(field_trips_path)
  end

  scenario 'Updating a Field Trip' do
    create(:field_trip)
    visit field_trips_url
    click_on 'Edit', match: :first

    fill_in :field_trip_name, with: 'Denver Aquarium 2019 Senior Trip'
    click_on 'Update Field trip'

    expect(page).to have_content 'Field trip was successfully updated'
    expect(page).to have_content 'Denver Aquarium 2019 Senior Trip'

    click_on 'Back'
    expect(current_path).to eq(field_trips_path)
  end

  scenario 'Destroying a Field trip' do
    create(:field_trip, name: 'This will be deleted')
    visit field_trips_url

    click_on 'Destroy', match: :first

    expect(page).to have_content 'Field trip was successfully destroyed'
    expect(page).not_to have_content 'This will be deleted'
  end
end
