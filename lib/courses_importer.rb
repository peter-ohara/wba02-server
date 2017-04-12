# Class for extracting courses from json imported from Firebase,
# and saving them in this App's database
class CoursesImporter
  def initialize(json_data)
    @courses_hash = json_data['courses']
  end

  def import_courses
    @courses_hash.each do |_key, course_hash|
      course = get_course(course_hash)

      if course.save
        puts "Course created successfully: #{course.name}"
      else
        puts "Error creating course, #{course.errors.inspect}"
      end
    end
  end

  def get_course(course_hash)
    code = course_hash['code']
    name = course_hash['name']
    level = course_hash['level'] - 1
    semester = course_hash['semester'] - 1

    Course.find_or_initialize_by(code: code,
                                 name: name,
                                 level: level,
                                 semester: semester)
  end
end