class TaggingJoinsController < ApplicationController
  def index
    @tagging_joins = TaggingJoin.all

    render("tagging_joins/index.html.erb")
  end

  def show
    @tagging_join = TaggingJoin.find(params[:id])

    render("tagging_joins/show.html.erb")
  end

  def new
    @tagging_join = TaggingJoin.new

    render("tagging_joins/new.html.erb")
  end

  def create
    @tagging_join = TaggingJoin.new

    @tagging_join.tag_id = params[:tag_id]
    @tagging_join.posting_id = params[:posting_id]

    save_status = @tagging_join.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/tagging_joins/new", "/create_tagging_join"
        redirect_to("/tagging_joins")
      else
        redirect_back(:fallback_location => "/", :notice => "Tagging join created successfully.")
      end
    else
      render("tagging_joins/new.html.erb")
    end
  end

  def edit
    @tagging_join = TaggingJoin.find(params[:id])

    render("tagging_joins/edit.html.erb")
  end

  def update
    @tagging_join = TaggingJoin.find(params[:id])

    @tagging_join.tag_id = params[:tag_id]
    @tagging_join.posting_id = params[:posting_id]

    save_status = @tagging_join.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/tagging_joins/#{@tagging_join.id}/edit", "/update_tagging_join"
        redirect_to("/tagging_joins/#{@tagging_join.id}", :notice => "Tagging join updated successfully.")
      else
        redirect_back(:fallback_location => "/", :notice => "Tagging join updated successfully.")
      end
    else
      render("tagging_joins/edit.html.erb")
    end
  end

  def destroy
    @tagging_join = TaggingJoin.find(params[:id])

    @tagging_join.destroy

    if URI(request.referer).path == "/tagging_joins/#{@tagging_join.id}"
      redirect_to("/", :notice => "Tagging join deleted.")
    else
      redirect_back(:fallback_location => "/", :notice => "Tagging join deleted.")
    end
  end
end
