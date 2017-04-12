# Class for extracting question headers from json imported from Firebase,
# and saving them in this App's database
class HeadersImporter
  require 'import_utils'
  include ImportUtils

  def initialize(json_data)
    @tests_hash = json_data['tests']
    @questions_hash = json_data['questions']
  end

  def import_headers
    @questions_hash.each do |_key, question_hash|
      test_key = question_hash['testKey']
      question_type = question_hash['type']

      next unless @tests_hash[test_key]

      priority = @tests_hash[test_key]['questionKeys'][_key]
      quiz = get_quiz(test_key)

      create_header(question_hash, quiz, priority) if question_type == 'header'
    end
  end

  def create_header(question_hash, quiz, priority)
    header = get_header(question_hash, quiz, priority)

    if header.save
      puts "Header created successfully: #{header.title}"
    else
      puts "Error creating header, #{header.errors.inspect}"
    end
  end

  def get_header(question_hash, quiz, priority)
    title = question_hash['title']
    content = question_hash['content']

    Header.find_or_initialize_by(quiz_id: quiz.id,
                                 priority: priority,
                                 title: title,
                                 content: content)
  end
end