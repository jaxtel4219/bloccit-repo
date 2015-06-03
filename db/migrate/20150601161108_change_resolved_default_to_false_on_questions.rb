class ChangeResolvedDefaultToFalseOnQuestions < ActiveRecord::Migration
  def change
    change_column_default :questions, :resolved, false
    Question.all.each do |q|
      if q.resolved.nil? 
        q.update(resolved: false)
      end
    end
  end
end
