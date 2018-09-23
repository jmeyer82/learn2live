# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


def profile_type_defined
    if rand(1) 
        return "Searcher"
    else
        return "Sharer"
    end
end


10.times.each { |x| 
    User.create(
        name: "#{Faker::StarTrek.character}",
        profile_type: "#{profile_type_defined}",
        roles: "#{FFaker::CompanyIT.prefix}",
        education: "#{Faker::Educator}",
        time: "#{Faker::Time.between(2.days.ago, Date.today, :all)}",
        description_roles: "#{FFaker::Education.degree_short}",
        description_education: "#{FFaker::Education.degree}",
        attributes_roles: "#{FFaker::CompanyIT.prefix}",
        attributes_education: "#{FFaker::Internet.slug}",
        skill_share: "#{Faker::Boolean.boolean}"
        )
}