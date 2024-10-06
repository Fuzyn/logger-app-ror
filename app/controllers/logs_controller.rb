class LogsController < ApplicationController
  skip_before_action :verify_authenticity_token

  def index
    @logs = Log.all.order("created_at DESC")
    @logs = @logs.where("message ILIKE ?", "%#{params[:query]}%") if params[:query].present?
    @logs = @logs.page(params[:page]).per(10)
    @next_page = params[:page].to_i + 1 if @logs.next_page.present?
    # @logs = @logs.order(&:created_at).reverse

    # @logs = Log.page(params[:page]).per(10) # Paginuje logi po 10 na stronę
    # @next_page = params[:page].to_i + 1 if @logs.next_page.present?

    respond_to do |format|
      format.html
      format.turbo_stream
    end
  end

  def create
    Log.create!(message: params[:message], user_email: params[:user_email], user_id: params[:user_id])
    render json: { status: 'Log received' }, status: :ok
  end
end
