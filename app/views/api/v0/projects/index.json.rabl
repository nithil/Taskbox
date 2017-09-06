if @projects.empty?
	node(:notice){"No projects found"}
else
	collection @projects
	attributes :id, :name, :client_id, :start_date, :end_date
end