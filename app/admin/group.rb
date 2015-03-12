ActiveAdmin.register Group do


  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # permit_params :list, :of, :attributes, :on, :model
  #
  # or
  #
  # permit_params do
  #   permitted = [:permitted, :attributes]
  #   permitted << :other if resource.something?
  #   permitted
  # end

permit_params :group_name, :delegates,
delegates_attributes: [:groups, :fullname]

form do |f|
    f.inputs "Basic Information" do
        f.input :delegates, :multiple => true, as: :check_boxes, :collection => Delegate.all
    end
    f.actions
end

# GBTT unsafe 
controller do
  def permitted_params
    params.permit!
  end
end

end