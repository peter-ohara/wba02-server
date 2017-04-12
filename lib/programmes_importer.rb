# Class for extracting programme from json imported from Firebase,
# and saving them in this App's database
class ProgrammesImporter
  def initialize(json_data)
    @schools_hash = json_data['schools']
    @programmes_hash = json_data['programmes']
  end

  def import_programmes
    @programmes_hash.each do |_key, programme_hash|
      programme = get_programme(programme_hash)

      if programme.save
        puts "Programme created successfully: #{programme.name}"
      else
        puts "Error creating programme, #{programme.errors.inspect}"
      end
    end
  end

  def get_programme(programme_hash)
    name = programme_hash['name']
    school = get_school(programme_hash)
    Programme.find_or_initialize_by(name: name,
                                    school_id: school.id)
  end

  def get_school(programme_hash)
    school_key = programme_hash['schoolKey']
    school_name = @schools_hash[school_key]['name']
    school_short_name = @schools_hash[school_key]['shortName']
    School.where(name: school_name,
                 short_name: school_short_name).first
  end
end