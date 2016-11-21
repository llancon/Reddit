class LinksController < ApplicationController
  before_action :set_link, only: [:show, :edit, :update, :destroy, :upvote]

  # GET /links
  # GET /links.json
  def index
    @links = Link.all.sort_by { |link| link.votes.count }.reverse
  end

  def upvote
    if current_user
      @link.votes.create!(user: current_user)
      redirect_to root_path
    else
      render :new
    end
  end

  # GET /links/1
  # GET /links/1.json
  def show
      @link.votes.create!(user: current_user)
      redirect_to @link.title
  end

  # GET /links/new
  def new
    @link = Link.new
  end

  # GET /links/1/edit
  def edit
  end

  # POST /links
  # POST /links.json
  def create
    @link = Link.new(link_params)
    @link.user = current_user
    respond_to do |_format|
      if @link.save
        tag_names = params[:link][:tag_names].split(',')
        tag_names = tag_names.collect(&:strip)
        tag_names.each do |name|
          @link.tags << Tag.find_or_initialize_by(name: name)
        end
        flash[:success] = 'Your post is posted!'
        redirect_to links_path
      else
        render :new
    end
    end
  end

  # end  # PATCH/PUT /links/1
  # PATCH/PUT /links/1.json
  def update
    @link = current_user.links.new(link_params)
    respond_to do |format|
      if @link.update(link_params)
        tag_names.each do |name|
          @link.tags << Tag.find_or_initialize_by(name: name)
        end
        format.html { redirect_to @link, notice: 'Link was successfully updated.' }
        format.json { render :show, status: :ok, location: @link }
      else
        new
      end
    end
  end

  # DELETE /links/1
  # DELETE /links/1.json
  def destroy
    @link.destroy
    respond_to do |format|
      format.html { redirect_to links_url, notice: 'Link was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_link
    @link = Link.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def link_params
    params.require(:link).permit(:name, :title, :description, :tag)
  end
end
