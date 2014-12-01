class Project < ActiveRecord::Base
  validates :name, presence: true

  ## Use this if you have callback on Ticket and you have a large
  ## number of tickets on the project being deleted.
  # has_many :tickets, dependent: :destroy
  #
  ## Use this if you have a large number of tickets and don't have
  ## callbacks, or have callback that you don't necessarily care about
  ## when deleting a project
  # has_many :tickets, dependent: :destroy_all
  has_many :tickets, dependent: :delete_all
  #
  ## Finally, if you just want to disassociate tickets from a project
  ## and unset the project_id
  # has_many :tickets, dependent: :nullify

end
