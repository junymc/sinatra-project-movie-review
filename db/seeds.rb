items =[
    "Avengers",
    "Star Wars",
    "John Wick",
    "Mission Impossible",
    "Hangover",
    "Jurassic Park"
]

items.each {|item| Movie.create(name: item) }