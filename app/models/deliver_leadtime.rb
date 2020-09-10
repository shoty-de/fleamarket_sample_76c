class DeliverLeadtime < ActiveHash::Base
  self.data = [
    {id: 1, leadtime: "1~2日で発送"},
    {id: 2, leadtime: "2~3日で発送"},
    {id: 3, leadtime: "4~7日で発送"}
  ]

  include ActiveHash::Associations
  has_many :products

end
