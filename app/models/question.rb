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

  #attr_accessible :tag, :owner, :is_answered, :view_count, :answer_count, :score, :last_activity_date, :creation_date, :last_edit_date, :question_id, :link, :title
end
