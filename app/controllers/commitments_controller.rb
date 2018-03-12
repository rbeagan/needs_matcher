class CommitmentsController < ApplicationController
  def index
    @q = Commitment.ransack(params[:q])
    @commitments = @q.result(:distinct => true).includes(:user, :posting).page(params[:page]).per(10)

    render("commitments/index.html.erb")
  end

  def show
    @commitment = Commitment.find(params[:id])

    render("commitments/show.html.erb")
  end

  def new
    @commitment = Commitment.new

    render("commitments/new.html.erb")
  end

  def create
    @commitment = Commitment.new

    @commitment.user_id = params[:user_id]
    @commitment.posting_id = params[:posting_id]

    save_status = @commitment.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/commitments/new", "/create_commitment"
        redirect_to("/commitments")
      else
        redirect_back(:fallback_location => "/", :notice => "Commitment created successfully.")
      end
    else
      render("commitments/new.html.erb")
    end
  end

  def edit
    @commitment = Commitment.find(params[:id])

    render("commitments/edit.html.erb")
  end

  def update
    @commitment = Commitment.find(params[:id])

    @commitment.user_id = params[:user_id]
    @commitment.posting_id = params[:posting_id]

    save_status = @commitment.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/commitments/#{@commitment.id}/edit", "/update_commitment"
        redirect_to("/commitments/#{@commitment.id}", :notice => "Commitment updated successfully.")
      else
        redirect_back(:fallback_location => "/", :notice => "Commitment updated successfully.")
      end
    else
      render("commitments/edit.html.erb")
    end
  end

  def destroy
    @commitment = Commitment.find(params[:id])

    @commitment.destroy

    if URI(request.referer).path == "/commitments/#{@commitment.id}"
      redirect_to("/", :notice => "Commitment deleted.")
    else
      redirect_back(:fallback_location => "/", :notice => "Commitment deleted.")
    end
  end
end
