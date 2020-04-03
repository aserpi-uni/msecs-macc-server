class Client < ApplicationRecord
  include Updatable

  has_and_belongs_to_many :workspaces, through: :workspaces, after_add: :touch_updated_at, after_remove: :touch_updated_at
  has_many :workers, -> { distinct }, through: :workspaces

  validates :name, presence: true, uniqueness: true

  # Create a new Workspace from +create+ action parameters.
  def self.from_params(params)
    workspace = Client.new

    workspace.color = params[:color]
    workspace.description = params[:description]
    workspace.name = params[:name]

    workspace
  end
end
