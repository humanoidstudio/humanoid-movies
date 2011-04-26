# Read about factories at http://github.com/thoughtbot/factory_girl

Factory.define :movie do |f|
  f.name "MyString"
  f.plot "MyText"
  f.imdb_score 1.5
  f.runtime 1
end