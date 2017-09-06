if @tasks.empty?
	node(:notice){"No tasks found"}
else
	collection @tasks
	attributes :id, :title, :due_date, :is_completed, :project_id
end