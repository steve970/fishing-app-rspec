def create_river(options= {})
  River.create!({
    name: 'Blue River',
    city: 'Frisco',
    state: 'CO',
  }.merge(options))
end
