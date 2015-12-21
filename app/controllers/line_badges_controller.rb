require "net/http"

class LineBadgesController < ApplicationController
  before_action :set_line_badge, only: [:show, :edit, :update, :destroy]

  # GET /line_badges
  # GET /line_badges.json
  def index
    @line_badges = LineBadge.where(User_id: current_user)
  end

  # GET /line_badges/1
  # GET /line_badges/1.json
  def show
  end

  # GET /line_badges/new
  def new
    @line_badge = LineBadge.new
  end

  # GET /line_badges/1/edit
  def edit
  end

  # POST /line_badges
  # POST /line_badges.json
  def create
    @line_badge = LineBadge.new(line_badge_params)

    respond_to do |format|
      if @line_badge.save
        format.html { redirect_to @line_badge, notice: 'Line badge was successfully created.' }
        format.json { render :show, status: :created, location: @line_badge }
      else
        format.html { render :new }
        format.json { render json: @line_badge.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /line_badges/1
  # PATCH/PUT /line_badges/1.json
  def update
    respond_to do |format|
      if @line_badge.update(line_badge_params)
        format.html { redirect_to @line_badge, notice: 'Line badge was successfully updated.' }
        format.json { render :show, status: :ok, location: @line_badge }
      else
        format.html { render :edit }
        format.json { render json: @line_badge.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /line_badges/1
  # DELETE /line_badges/1.json
  def destroy
    @line_badge.destroy
    respond_to do |format|
      format.html { redirect_to line_badges_url, notice: 'Line badge was successfully destroyed.' }
      format.json { head :no_content }
    end
  end


  def badge_wall_share
    @badge_id = params[:badge_id]
    @badge = Badge.find(@badge_id)
    @email = current_user.email
    @name = @badge.name
    @description = @badge.description
    @img = @badge.img_url

    uri = URI.parse("http://localhost:4444/badges/")
    response = Net::HTTP.post_form(uri, {"issuer_url" => "reino.com", 
      "issuer_organization" => "reino", "earner_email" => @email, "name" => @name, 
      "description" => @description, "img_url" => @img})
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_line_badge
      @line_badge = LineBadge.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def line_badge_params
      params.require(:line_badge).permit(:badge_id,:earner_email, :user_id)
    end
end
