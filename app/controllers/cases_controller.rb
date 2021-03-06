class CasesController < ApplicationController
  before_action :set_case, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_executive!, only: [:create, :edit, :update, :destroy]
 layout "delegate_dashboard"

  respond_to :html

  def index
    @cases = Case.all
    respond_with(@cases)
  end

  def show
    respond_with(@case)
  end

  def new
    @case = Case.new
    respond_with(@case)
  end

  def edit
  end

  def winners
  end

  def hosts
  end

  def create
    @case = Case.new(case_params)
    @case.save
    respond_with(@case)
  end

  def update
    @case.update(case_params)
    respond_with(@case)
  end

  def destroy
    @case.destroy
    respond_with(@case)
  end

  private
    def set_case
      @case = Case.find(params[:id])
    end

    def case_params
      params.require(:case).permit(:title, :sponsor, :description, :document, :sponsor_logo)
    end

    # Don't allow delegates to access what they're not supposed to
    def authenticate_executive!
      if not current_admin_user
        raise ActionController::RoutingError.new('Not Found')
    end
  end
end
