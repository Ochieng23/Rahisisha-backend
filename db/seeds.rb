# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
def generate_code(length)
    # characters allowed in the varchar string
    chars = ('a'..'z').to_a + ('0'..'9').to_a
  
    # Generate a random string of the desired length
    random_string = (0...length).map { chars[rand(chars.length)] }.join
  
    # Insert hyphens after every 3 characters
    random_string.insert(4, '-').insert(9, '-')
end  
jobtags = Jobtag.create([
    {jobtag_code: generate_code(12), group_name: "Engineering"},
    {jobtag_code: generate_code(12), group_name: "Agriculture"},
    {jobtag_code: generate_code(12), group_name: "Teaching"},
    {jobtag_code: generate_code(12), group_name: "Law"},
    {jobtag_code: generate_code(12), group_name: "Human Resource"},
    {jobtag_code: generate_code(12), group_name: "Finance"},
    {jobtag_code: generate_code(12), group_name: "Religion"},
    {jobtag_code: generate_code(12), group_name: "Statistics"},
    {jobtag_code: generate_code(12), group_name: "Social Work"},
    {jobtag_code: generate_code(12), group_name: "Environmental"},
    {jobtag_code: generate_code(12), group_name: "Office Work"},
    {jobtag_code: generate_code(12), group_name: "Hotel"},
    {jobtag_code: generate_code(12), group_name: "Casual"}
])
