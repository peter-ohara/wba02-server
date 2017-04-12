# Class for extracting schools from json imported from Firebase,
# and saving them in this App's database
class SchoolsImporter
  def initialize(json_data)
    @schools_hash = json_data['schools']
  end

  def import_schools
    @schools_hash.each do |_key, school_hash|
      name = school_hash['name']
      short_name = school_hash['shortName']

      school = School.find_or_initialize_by(name: name, short_name: short_name)

      if school.save
        puts "School created successfully: #{school.name}"
      else
        puts "Error creating school, #{school.errors.inspect}"
      end
    end
  end
end
