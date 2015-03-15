ActiveAdmin.register_page "Dashboard" do

  menu priority: 1, label: proc{ I18n.t("active_admin.dashboard") }


  content title: proc{ I18n.t("active_admin.dashboard") } do
=begin   div class: "blank_slate_container", id: "dashboard_default_message" do
      span class: "blank_slate" do
        span I18n.t("active_admin.dashboard_welcome.welcome")
        small I18n.t("active_admin.dashboard_welcome.call_to_action")
      end
=end   end


    # Here is an example of a simple dashboard with columns and panels.
    #

columns do
  column do
    span "Exec Feedback : "
    status_tag "Good / Bad"
    li text_node "Culprids"
  end
  column do
    span "Delegate Feedback : "
    status_tag "Good / Bad"
    li text_node "Culprids"
  end
  column do
    span "Scoring : "
    status_tag "Good / Bad"
    li text_node "Culprids"
  end
end


div class: 'col-md-12' do
   table_for Delegate.all.order(total_score: :desc).each, class: 'table table-condensed' do
  column(:fullname)
  column "Competition Score",          :total_score
end
end
=begin
  

=end
  end # content
end