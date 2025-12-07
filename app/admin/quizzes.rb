ActiveAdmin.register Quiz do
  permit_params :title, :description,
                questions_attributes: [
                  :id, :content, :question_type, :correct_answer, :_destroy,
                  options_attributes: [:id, :content, :correct, :_destroy]
                ]

  form do |f|
    f.inputs "Quiz details" do
      f.input :title
      f.input :description
    end

    f.has_many :questions, allow_destroy: true, heading: "Questions", new_record: "Add Question" do |q|
      q.input :content
      q.input :question_type, as: :select, collection: Question.question_types.keys
      q.input :correct_answer

      q.has_many :options, allow_destroy: true, new_record: "Add Option" do |opt|
        opt.input :content
        opt.input :correct
      end
    end

    f.actions
  end  
end
