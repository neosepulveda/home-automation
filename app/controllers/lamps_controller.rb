class LampsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_lamp, only: [ :show, :edit, :update, :destroy, :on, :off ]
  before_action :load_script, only: [ :exec ]
  after_action :generate_scripts, only: [ :create, :update ]
  respond_to :html, :js

  # GET /lamps
  # GET /lamps.json
  def index
    @lamps = Lamp.all
  end

  # GET /lamps/1
  # GET /lamps/1.json
  def show
  end

  # GET /lamps/new
  def new
    @lamp = Lamp.new
  end

  # GET /lamps/1/edit
  def edit
  end

  # POST /lamps
  # POST /lamps.json
  def create
    @lamp = Lamp.new(lamp_params)

    respond_to do |format|
      if @lamp.save
        format.html { redirect_to @lamp, notice: 'Lamp was successfully created.' }
        format.json { render :show, status: :created, location: @lamp }
      else
        format.html { render :new }
        format.json { render json: @lamp.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /lamps/1
  # PATCH/PUT /lamps/1.json
  def update
    respond_to do |format|
      if @lamp.update(lamp_params)
        format.html { redirect_to @lamp, notice: 'Lamp was successfully updated.' }
        format.json { render :show, status: :ok, location: @lamp }
      else
        format.html { render :edit }
        format.json { render json: @lamp.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /lamps/1
  # DELETE /lamps/1.json
  def destroy
    @lamp.destroy
    respond_to do |format|
      format.html { redirect_to lamps_url, notice: 'Lamp was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def on
    script = Script.find(@lamp.onscript)    

    system('python ' + "/home/neo/home-automation/tmp/pyscripts/" + @lamp.name.downcase.gsub(/\s+/, "") + "/" + script.name.downcase.gsub(/\s+/, "") + ".py")
    @lamp.status = 1
    @lamp.save
  end

  def off
    script = Script.find(@lamp.offscript)

    system('python ' + "/home/neo/home-automation/tmp/pyscripts/" + @lamp.name.downcase.gsub(/\s+/, "") + "/" + script.name.downcase.gsub(/\s+/, "") + ".py")
    @lamp.status = 0
    @lamp.save
  end

  def exec
    system('python ' + "/home/neo/home-automation/tmp/pyscripts/" + @script.lamp.name.downcase.gsub(/\s+/, "") + "/" + @script.name.downcase.gsub(/\s+/, "") + ".py")
    
    if @script.name.downcase == 'on' then
      @script.lamp.status = 1
      @script.lamp.save
    elsif @script.name.downcase == 'off' then
      @script.lamp.status = 0
      @script.lamp.save
    end

    head :ok, content_type: "text/html"
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_lamp
      @lamp = Lamp.find(params[:id])
    end

    def load_script
      @script = Script.find(params[:id])
    end

    def generate_scripts
      if !@lamp.scripts.empty? then
        directory = "/home/neo/home-automation/tmp/pyscripts/" + @lamp.name.downcase.gsub(/\s+/, "")
        FileUtils.mkdir_p directory if !File.directory?(directory) 
        @lamp.scripts.each do |script|
          path = directory + "/" + script.name.downcase + ".py"
          File.open(path, "w+") do |f|
            f.write(script.code)
          end
        end
      end
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def lamp_params
      params.require(:lamp).permit(:name, :description, :calendar, :status, :onscript, :offscript, :image, scripts_attributes: [ :id, :name, :code, :_destroy ])
    end
end
