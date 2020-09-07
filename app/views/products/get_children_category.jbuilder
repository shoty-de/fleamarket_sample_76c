json.array! @category_children do |child|
  json.child_id child.id
  json.child_name child.name
end