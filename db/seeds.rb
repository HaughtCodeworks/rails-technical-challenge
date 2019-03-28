if Rails.env.development?
  [
    { first_name: 'Bob', last_name: 'Ross' },
    { first_name: 'Grete', last_name: 'Hermann' },
    { first_name: 'Narendranath', last_name: 'Datta' }
  ].each do |data|
    Student.find_or_create_by!(data)
  end

  [
    { name: '2020 Trip to the Denver Aquarium' }
  ].each do |data|
    FieldTrip.find_or_create_by!(data)
  end
end
