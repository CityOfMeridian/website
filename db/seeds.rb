# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

org_type_government = OrganizationType.create(name: 'government')
org_type_community = OrganizationType.create(name: 'community')

Fae::Role.create(name: 'city admin').organizations << Organization.find_or_create_by(name: 'City', organization_type: org_type_government)
Fae::Role.create(name: 'edc admin',).organizations << Organization.find_or_create_by(name: 'EDC', organization_type: org_type_government)
Fae::Role.find_by(name: 'admin').organizations << Organization.all