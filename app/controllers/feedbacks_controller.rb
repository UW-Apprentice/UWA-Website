class FeedbacksController < ApplicationController
before_action :set_feedback, only: [:show, :edit, :update, :destroy]
before_action :authenticate_executive!, only: [:edit, :update, :destroy]


# GBTT: EXTREMELY UNSAFE BECAUSE OF THE METHOD
 layout :set_layout

 #layout "exec_evaluation", only: [:exec_feedback, :exec_case_eval, :exec_feedback_win]

  respond_to :html

  def index
    @feedbacks = Feedback.all
    respond_with(@feedbacks)
  end

  def show
    respond_with(@feedback)
  end

  def new
    #@feedback = Feedback.new
    # See the feedback you've given
    @feedback = current_delegate.feedbacks.build
    respond_with(@feedback)
    
  end

  def exec_feedback
    @feedback = Feedback.new
    respond_with(@feedback)
  end

  def exec_case_eval
    @feedback = Feedback.new
=begin
    @projected_case_id = Case.where(:case_sponsor => true).where(:done => true).count + 1
    @receiver = Delegate.where(:email => @feedback.receiver).first.id

    # Leadership = impact, creativity = feasibility, business_sense = innovation, presentation_skills = presentation, overall_contribution = overall
    Delegate.update_case_eval_scores(@receiver, @projected_case_id, @feedback.leadership, @feedback.creativity, @feedback.business_sense, @feedback.presentation_skills, @feedback.overall_contribution)
=end
    respond_with(@feedback)

  end

  def exec_feedback_win
    @feedback = Feedback.new
    respond_with(@feedback)
  end
  def edit
  end

  def create

    secret_key_attributes = 8238
    secret_key_case = 1111
    secret_key_case_win = 5656

    if current_delegate
    @feedback = current_delegate.feedbacks.build(feedback_params)
  else
    @feedback = Feedback.new(feedback_params)
  end

    @feedback.save
   # @projected_case_id = Case.where(:case_sponsor => true).where(:done => true).count + 1
    
    @projected_case_id = Case.where(:case_sponsor => true).where(:done => true).count + 1

    @receiver = Delegate.where(:fullname => @feedback.receiver).first.id

    eval_type = 1 # Peer feedback

    if (@feedback.exec_secret == secret_key_attributes)
      eval_type = 2 # Exec feedback
      Delegate.update_peer_or_exec_scores(2, @projected_case_id, @receiver, @feedback.leadership, @feedback.creativity, @feedback.business_sense, @feedback.presentation_skills, @feedback.overall_contribution )

    elsif (@feedback.exec_secret == secret_key_case)
      # Leadership = impact, creativity = feasibility, business_sense = innovation, presentation_skills = presentation, overall_contribution = overall
    Delegate.update_case_eval_scores(@receiver, @projected_case_id - 1, @feedback.case_impact, @feedback.case_feasibility, @feedback.case_innovation, @feedback.case_presentation, @feedback.case_overall)

  elsif (@feedback.exec_secret == secret_key_case_win)

    Delegate.update_case_pos_scores(@receiver, @feedback.case_number, @feedback.case_position)
  else
    Delegate.update_peer_or_exec_scores(1, @projected_case_id -1, @receiver, @feedback.leadership, @feedback.creativity, @feedback.business_sense, @feedback.presentation_skills, @feedback.overall_contribution )
    end
    
    respond_with(@feedback)
  end

  def update
    @feedback.update(feedback_params)
    respond_with(@feedback)
  end

  def destroy
    @feedback.destroy
    respond_with(@feedback)
  end
  private
  def set_feedback
      @feedback = Feedback.find(params[:id])
    end

    def set_layout

      if current_delegate != nil
        "delegate_dashboard"
      else
        "exec_evaluation"
       end
     end

    def feedback_params
      params.require(:feedback).permit(:receiver, :good_comments, :improvement_comments, :leadership, :creativity, :overall_contribution, :business_sense, :presentation_skills, :exec_secret, :type, :case_impact, :case_feasibility, :case_overall, :case_innovation, :case_presentation, :case_position, :case_number)
    end

    # Don't allow delegates to access what they're not supposed to
    def authenticate_executive!
      if not current_admin_user
        raise ActionController::RoutingError.new('Not Found')
    end
  end

end
