ThinkingSphinx::Index.define :good, with: :active_record do

  #fields
  indexes :name, sortable: true
  indexes description

  #attributes
  has created_at, updated_at, category_id
end