class PostingsController < ApplicationController
  before_action :current_user_must_be_posting_poster, :only => [:edit, :update, :destroy]

  def current_user_must_be_posting_poster
    posting = Posting.find(params[:id])

    unless current_user == posting.poster
      redirect_to :back, :alert => "You are not authorized for that."
    end
  end

  def index
    @postings = Posting.all

    render("postings/index.html.erb")
  end

  def show
    @posting = Posting.find(params[:id])

    render("postings/show.html.erb")
  end

  def new
    @posting = Posting.new

    render("postings/new.html.erb")
  end

  def create
    @posting = Posting.new

    @posting.description = params[:description]
    @posting.volunteers_needed = params[:volunteers_needed]
    @posting.start_date = params[:start_date]
    @posting.end_date = params[:end_date]
    @posting.actions = params[:actions]
    @posting.poster_id = params[:poster_id]

    save_status = @posting.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/postings/new", "/create_posting"
        redirect_to("/postings")
      else
        redirect_back(:fallback_location => "/", :notice => "Posting created successfully.")
      end
    else
      render("postings/new.html.erb")
    end
  end

  def edit
    @posting = Posting.find(params[:id])

    render("postings/edit.html.erb")
  end

  def update
    @posting = Posting.find(params[:id])

    @posting.description = params[:description]
    @posting.volunteers_needed = params[:volunteers_needed]
    @posting.start_date = params[:start_date]
    @posting.end_date = params[:end_date]
    @posting.actions = params[:actions]
    @posting.poster_id = params[:poster_id]

    save_status = @posting.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/postings/#{@posting.id}/edit", "/update_posting"
        redirect_to("/postings/#{@posting.id}", :notice => "Posting updated successfully.")
      else
        redirect_back(:fallback_location => "/", :notice => "Posting updated successfully.")
      end
    else
      render("postings/edit.html.erb")
    end
  end

  def destroy
    @posting = Posting.find(params[:id])

    @posting.destroy

    if URI(request.referer).path == "/postings/#{@posting.id}"
      redirect_to("/", :notice => "Posting deleted.")
    else
      redirect_back(:fallback_location => "/", :notice => "Posting deleted.")
    end
  end
end
