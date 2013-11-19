class HopsController < ApplicationController
  before_action :set_hop, only: [:show, :edit, :update, :destroy]
  before_filter :authorize!

  # GET /hops
  # GET /hops.json
  #def index
    #@hops = Hop.all
  #end

  # GET /hops/1
  # GET /hops/1.json
  def show
  end

  # GET /hops/new
  def new
    @hop = Hop.new user: current_user, brewery: brewery
  end

  # POST /hops
  # POST /hops.json
  def create
    @hop = Hop.new hop_params
    @hop.user = current_user
    @hop.brewery = brewery

    respond_to do |format|
      if @hop.save
        format.html { redirect_to [brewery, @hop], notice: @hop.success_message }
        format.json { render action: :show, status: :created, location: @hop }
      else
        format.html { render action: :new }
        format.json { render json: @hop.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /hops/1
  # PATCH/PUT /hops/1.json
  #def update
    #respond_to do |format|
      #if @hop.update(hop_params)
        #format.html { redirect_to @hop, notice: 'Hop was successfully updated.' }
        #format.json { head :no_content }
      #else
        #format.html { render action: 'edit' }
        #format.json { render json: @hop.errors, status: :unprocessable_entity }
      #end
    #end
  #end

  # DELETE /hops/1
  # DELETE /hops/1.json
  #def destroy
    #@hop.destroy
    #respond_to do |format|
      #format.html { redirect_to hops_url }
      #format.json { head :no_content }
    #end
  #end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_hop
    @hop = Hop.find params[:id]
  end

  def brewery
    Brewery.find params[:brewery_id]
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def hop_params
    params.require(:hop).permit :remote_image_url, :message, :image
  end
end
