# Class for extracting quizzes from json imported from Firebase,
# and saving them in this App's database
class QuizzesImporter
  require 'import_utils'
  include ImportUtils

  def initialize(json_data)
    @courses_hash = json_data['courses']
    @tests_hash = json_data['tests']
  end

  def import_quizzes
    @tests_hash.each do |_key, test_hash|
      quiz = get_quiz_from_test_hash(test_hash)

      if quiz.save
        puts "Quiz created successfully: #{quiz.name}"
      else
        puts "Error creating quiz, #{quiz.errors.inspect}"
      end
    end
  end

  def get_quiz_from_test_hash(test_hash)
    course_key = test_hash['courseKey']
    instructions = test_hash['instructions']
    duration = test_hash['duration']
    quiz_type = get_quiz_type(test_hash['type'])
    year = test_hash['year']
    pasco_credits = 10

    course = get_course(course_key)

    quiz = Quiz.find_or_initialize_by(course_id: course.id,
                                      duration: duration,
                                      quiz_type: quiz_type,
                                      year: year,
                                      pasco_credits: pasco_credits)

    quiz.instructions = instructions
    quiz
  end

  def get_course(course_key)
    course_code = @courses_hash[course_key]['code']
    course_name = @courses_hash[course_key]['name']
    course_level = @courses_hash[course_key]['level'] - 1
    course_semester = @courses_hash[course_key]['semester'] - 1

    Course.where(code: course_code,
                 name: course_name,
                 level: course_level,
                 semester: course_semester).first
  end
end