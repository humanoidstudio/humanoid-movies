# Read about factories at http://github.com/thoughtbot/factory_girl

Factory.define :movie do |f|
  f.name "Movie name"
  f.published_name "Published name"
  f.year 1999
  f.plot "Some Plot"
  f.imdb_score 1.5
  f.runtime 1
end