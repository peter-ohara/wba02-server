# Class for extracting fill in questions from json imported from Firebase,
# and saving them in this App's database
class FillInQuestionsImporter
  require 'import_utils'
  include ImportUtils

  def initialize(json_data)
    @tests_hash = json_data['tests']
    @questions_hash = json_data['questions']
  end

  def import_questions
    @questions_hash.each do |_key, question_hash|
      test_key = question_hash['testKey']
      question_type = question_hash['type']

      next unless @tests_hash[test_key]

      priority = @tests_hash[test_key]['questionKeys'][_key]
      quiz = get_quiz(test_key)

      create_fill_in_question(question_hash, quiz, priority) if question_type == 'fillIn'
    end
  end

  def create_fill_in_question(question_hash, quiz, priority)
    fill_in_question = get_fill_in_question(question_hash, quiz, priority)

    if fill_in_question.save
      puts "FillInQuestion created successfully: #{fill_in_question.number}"
    else
      puts "Error creating fill_in_question, #{fill_in_question.errors.inspect}"
    end
  end

  def get_fill_in_question(question_hash, quiz, priority)
    question = question_hash['question']
    answer = question_hash['answer']
    explanation = question_hash['explanation']
    number = question_hash['number']

    FillInQuestion.find_or_initialize_by(quiz_id: quiz.id,
                                         priority: priority,
                                         number: number,
                                         question: question,
                                         explanation: explanation,
                                         answer: answer)
  end
end