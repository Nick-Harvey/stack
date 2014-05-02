class Ambassador
  include Mongoid::Document
  field :Name,              type: String
  field :Stack_Username,    type: String
  field :Total,             type: Integer

def stacktotal
  Ambassador.update_attribute(:Total, "#{Question.where(:'answers.owner.display_name' => a.Stack_Username).count}")
end

end
