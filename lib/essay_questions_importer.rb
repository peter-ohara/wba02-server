# Class for extracting essay questions from json imported from Firebase,
# and saving them in this App's database
class EssayQuestionsImporter
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

      create_essay_question(quiz, question_hash, priority) if question_type == 'essay'
    end
  end

  def create_essay_question(quiz, question_hash, priority)
    essay_question = get_essay_question(question_hash, quiz, priority)

    if essay_question.save
      puts "EssayQuestion created successfully: #{essay_question.number}"
    else
      puts "Error creating essay_question, #{essay_question.errors.inspect}"
    end
  end

  def get_essay_question(question_hash, quiz, priority)
    question = question_hash['question']
    answer = question_hash['answer']
    explanation = question_hash['explanation']
    number = question_hash['number']

    EssayQuestion.find_or_initialize_by(quiz_id: quiz.id,
                                        priority: priority,
                                        number: number,
                                        question: question,
                                        explanation: explanation,
                                        answer: answer)
  end
end