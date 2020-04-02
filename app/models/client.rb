class Client < ApplicationRecord

  validates :name, presence: true, uniqueness: true

  # Create a new Workspace from +create+ action parameters.
  def self.from_params(params)
    workspace = Client.new

    color = Integer(params[:color][1..6], 16)
    workspace.color = color.positive? ? color : nil # Use black as default color
    workspace.description = params[:description]
    workspace.name = params[:name]

    workspace
  end
end
