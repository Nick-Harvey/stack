class Question
  include Mongoid::Document

  field :tag,                   :type => Array
  field :owner,                 :type => Hash
  field :is_answered,           :type => Boolean
  field :view_count,            :type => Integer
  field :answer_count,          :type => Integer
  field :score,                 :type => Integer
  field :last_activity_date,    :type => Integer
  field :creation_date,         :type => Integer
  field :last_edit_date,        :type => Integer
  field :question_id,           :type => Integer
  field :link,                  :type => String
  field :title,                 :type => String
  field :answers,               :type => Hash
  #attr_accessible :tag, :owner, :is_answered, :view_count, :answer_count, :score, :last_activity_date, :creation_date, :last_edit_date, :question_id, :link, :title
  validates :question_id, uniqueness: true

  def self.no_answer
    @no_answer = Question.where(answer_count: "0")
  end

  def self.tags
    @tags = Question.all.pluck(:tag)
  end

  def self.q_highscore
    @q_highscore = Question.where(:score.gte => 1)
  end

  #def self.a_highscore
  #  @a_highscore = Question.where(:'answers.items./d.score'.gte => 1)
  #end

end
