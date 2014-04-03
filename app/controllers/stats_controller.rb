class StatsController < ApplicationController
  before_action :set_stat, only: [:show, :edit, :update, :destroy]
  require 'groupdate'

  # GET /stats
  # GET /stats.json
  def index
    #blacklist = ["openshift"]
    @stats = Stat.all
    @tag_sort = Question.tags.flatten.group_by{|i| i}.map{|k,v| [k, v.count] }.sort_by {|k,v| v}.reverse.first(10)
    #@q_by_day = Questin
    #@a_highscore = Question.where(:'answers.items./d.score'.gte => 1)

    #@response = HTTParty.get("http://api.stackexchange.com/2.2/questions?&pagesize=100&order=desc&sort=activity&tagged=openshift&site=stackoverflow&filter=!9WgJfigc4&key=CtNgNzn5roqeORLJZ8ONGA((&client_id=2825&run=true")
  end
  # GET /stats/1
  # GET /stats/1.json
  def show
  end

  # GET /stats/new
  def new
    @stat = Stat.new
  end

  # GET /stats/1/edit
  def edit
  end

  # POST /stats
  # POST /stats.json
  def create
    @stat = Stat.new(stat_params)

    respond_to do |format|
      if @stat.save
        format.html { redirect_to @stat, notice: 'Stat was successfully created.' }
        format.json { render action: 'show', status: :created, location: @stat }
      else
        format.html { render action: 'new' }
        format.json { render json: @stat.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /stats/1
  # PATCH/PUT /stats/1.json
  def update
    respond_to do |format|
      if @stat.update(stat_params)
        format.html { redirect_to @stat, notice: 'Stat was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @stat.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /stats/1
  # DELETE /stats/1.json
  def destroy
    @stat.destroy
    respond_to do |format|
      format.html { redirect_to stats_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_stat
      @stat = Stat.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def stat_params
      params[:stat]
    end
end
