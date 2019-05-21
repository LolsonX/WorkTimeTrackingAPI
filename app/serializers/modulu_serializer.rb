class ModuluSerializer < ActiveModel::Serializer
  attributes :id,
             :name,
             :implementation_date,
             :project

  attribute :tasks

  def tasks
    object.tasks.map do |task|
      TaskSerializer.new task
    end
  end

end
