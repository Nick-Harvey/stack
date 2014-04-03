class Question
  include Mongoid::Document
  include Mongoid::Timestamps


  field :tag,                   :type => Array
  field :owner,                 :type => Hash
  field :is_answered,           :type => Boolean
  field :view_count,            :type => Integer
  field :answer_count,          :type => Integer
  field :score,                 :type => Integer
  field :last_activity_date,    :type => Integer
  field :creation_date,         :type => DateTime
  field :last_edit_date,        :type => Integer
  field :question_id,           :type => Integer
  field :link,                  :type => String
  field :title,                 :type => String
  field :answers,               :type => Array
  #attr_accessible :tag, :owner, :is_answered, :view_count, :answer_count, :score, :last_activity_date, :creation_date, :last_edit_date, :question_id, :link, :title
  validates :question_id, uniqueness: true

  index({ answers: 1 }, { name: "ssn_index" })

  def self.no_answer
    @no_answer = Question.where(answer_count: "0")
  end

  def self.tags
    @tags = Question.all.pluck(:tag)
  end

  def self.q_highscore
    @q_highscore = Question.where(:score.gte => 1).sort{|t1,t2|t2.score <=> t1.score}
  end

  def self.a_highscore
    @a_highscore = Question.where(:'answers.score'.gte => 1).sort{|t1,t2|t2.score <=> t1.score}
  end

end
