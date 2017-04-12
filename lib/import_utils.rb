module ImportUtils
  def get_quiz_type(test_type)
    case test_type
      when 'midSem'
        quiz_type = 0
      when 'endOfSem'
        quiz_type = 1
      when 'classTest'
        quiz_type = 2
      when 'assignment'
        quiz_type = 3
      else
        raise ArgumentError, 'Invalid test_type supplied'
    end

    quiz_type
  end

  def get_quiz(test_key)
    # REVIEW: Not including quiz_instructions when fetching the quiz
    #   might lead to the wrong quiz being fetched.

    # quiz_instructions = @tests_hash[test_key]['instructions']

    quiz_duration = @tests_hash[test_key]['duration']
    quiz_type = get_quiz_type(@tests_hash[test_key]['type'])
    quiz_year = @tests_hash[test_key]['year']

    Quiz.where(duration: quiz_duration,
               quiz_type: quiz_type,
               year: quiz_year).first
  end
end
