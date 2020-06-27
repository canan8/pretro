module ApplicationHelper
  def link_to_add_fields(name, f, association, entry_type)
    new_object = f.object.send(association).klass.new
    id = new_object.object_id
    fields = f.fields_for(association, new_object, child_index: id) do |builder|
      render(association.to_s.singularize + "_fields", f: builder, entry_type: entry_type)
    end
    link_to(name, '#', class: "add_fields ui icon mini button", data: {id: id, fields: fields.gsub("\n", "&#xA")})
  end
end
