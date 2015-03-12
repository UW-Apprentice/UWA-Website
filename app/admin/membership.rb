ActiveAdmin.register Membership do


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

permit_params :group_id, :delegate_id, :case_one_winner,:case_two_winner,:case_three_winner,:case_four_winner, :case_one_second,:case_two_second, :case_three_second,
:case_four_second, :case_one_third, :case_two_third, :case_three_third, :case_four_third

end
