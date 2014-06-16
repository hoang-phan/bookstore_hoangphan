ActiveAdmin.register Category, as: "My Category" do

  index do
    column :name
    column :sort_order
    actions
  end

  filter :name
  filter :sort_order

  form do |f|
    f.inputs "Category" do
      f.input :name
      f.input :sort_order
    end
    f.actions
  end

end
