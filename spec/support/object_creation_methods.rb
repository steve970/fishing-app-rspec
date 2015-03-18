def create_user(options = {})
  User.create!({
    first_name: 'Jennifer',
    last_name: 'H',
    email: 'jennifer@gschool.com',
    password: 'password'
  }.merge(options))
end

def create_river(options= {})
  River.create!({
    name: 'Blue River',
    city: 'Frisco',
    state: 'CO',
  }.merge(options))
end

def create_fish(river, options = {})
  Fish.create!({
    species: 'Carp',
    length: '27 inches',
    river_id: river.id
  }.merge(options))
end
