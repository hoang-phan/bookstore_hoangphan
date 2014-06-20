ActiveAdmin.register Book do

  before_filter do
    Book.class_eval do
      def to_param
        id.to_s
      end
    end
  end

  index do
    column :title
    column :description
    actions
  end

  filter :title
  filter :description
  # See permitted parameters documentation:
  # https://github.com/gregbell/active_admin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # permit_params :list, :of, :attributes, :on, :model
  #
  # or
  #
  # permit_params do
  #  permitted = [:permitted, :attributes]
  #  permitted << :other if resource.something?
  #  permitted
  # end

end
