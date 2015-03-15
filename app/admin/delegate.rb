ActiveAdmin.register Delegate do


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

permit_params :fullname, :email, :groups, :linkedin, :facebook, :twitter, :presentation, :business_sense, :communication, :creativity, :delegate_program, :case2_exec_leadership, :case2_exec_creativity, :case2_exec_business_sense, :case2_exec_presentation_skills, :case2_exec_overall_contribution, :total_score, :case2_eval_count, :case2_num_exec_evals, :case1_impact, :case1_feasibility, :case1_innovation, :case1_presentation, :case1_overall, :case2_impact, :case2_feasibility, :case2_innovation, :case2_presentation, :case2_overall


end
