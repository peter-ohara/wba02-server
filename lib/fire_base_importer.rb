# Class for extracting data from json imported from Firebase,
# and saving them in this App's database
class FireBaseImporter
  require 'json'

  require 'schools_importer'
  require 'programmes_importer'
  require 'courses_importer'
  require 'quizzes_importer'
  require 'headers_importer'
  require 'multiple_choice_questions_importer'
  require 'fill_in_questions_importer'
  require 'essay_questions_importer'

  def initialize(file_path)
    file = File.read(file_path)
    json_data = JSON.parse(file)

    @courses_importer = CoursesImporter.new(json_data)
    @essay_questions_importer = EssayQuestionsImporter.new(json_data)
    @fill_in_questions_importer = FillInQuestionsImporter.new(json_data)
    @headers_importer = HeadersImporter.new(json_data)
    @multiple_choice_questions_importer = MultipleChoiceQuestionsImporter.new(json_data)
    @programmes_importer = ProgrammesImporter.new(json_data)
    @quizzes_importer = QuizzesImporter.new(json_data)
    @schools_importer = SchoolsImporter.new(json_data)
  end

  def import_schools
    @schools_importer.import_schools
  end

  def import_programmes
    @programmes_importer.import_programmes
  end

  def import_courses
    @courses_importer.import_courses
  end

  def import_tests
    @quizzes_importer.import_quizzes
  end

  def import_questions
    @headers_importer.import_headers
    @multiple_choice_questions_importer.import_questions
    @fill_in_questions_importer.import_questions
    @essay_questions_importer.import_questions
  end

  def import_all
    import_schools
    import_programmes
    import_courses
    import_tests
    import_questions
  end
end

importer = FireBaseImporter.new('script/project-9175645934086190686-export.json')
importer.import_schools
importer.import_programmes
importer.import_courses
importer.import_tests
importer.import_questions
