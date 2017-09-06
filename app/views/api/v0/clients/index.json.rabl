if @clients.empty?
	node(:notice){"No clients found"}
else
	collection @clients
	attributes :id, :name, :mobile, :email, :website
end