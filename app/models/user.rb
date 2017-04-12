class User < ApplicationRecord
  has_secure_token :auth_token

  has_many :comments, inverse_of: :user, dependent: :destroy

  has_many :upvotes, inverse_of: :user, dependent: :destroy
  has_many :downvotes, inverse_of: :user, dependent: :destroy

  has_many :answers, inverse_of: :user, dependent: :destroy

  has_many :purchases, inverse_of: :user, dependent: :destroy

  has_many :purchases, dependent: :destroy
  has_many :quizzes, through: :purchases

  has_many :vouchers, inverse_of: :user

  validates :display_name, :email, presence: true
  validates :email, uniqueness: { case_sensitive: false }

  def name
    display_name unless new_record?
  end

  def buy_quizzes(quiz_ids)
    transaction do
      quiz_ids.each do |quiz_id|
        quiz = Quiz.lock(true).find(quiz_id)
        add_quiz(quiz)
      end
    end
  end

  def add_credits(voucher)
    return false if new_record?

    new_credit = calculate_new_credit(voucher)
    current_time = DateTime.current

    # TODO: Handle transaction errors
    transaction do
      voucher.update(user: self, usage_time: current_time)
      update(pasco_credits: new_credit)
    end
  end

  private

  def add_quiz(quiz)
    raise ArgumentError, 'Quiz costs more than user can afford' if pasco_credits < quiz.pasco_credits
    self.pasco_credits -= quiz.pasco_credits
    save!
    quizzes << quiz
  end

  def calculate_new_credit(voucher)
    if pasco_credits.nil?
      voucher.credits
    else
      pasco_credits + voucher.credits
    end
  end
end
