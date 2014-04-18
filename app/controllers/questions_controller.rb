class QuestionsController < ApplicationController

  before_action :set_question, only: [:show, :edit, :update, :destroy]

  # GET /questions
  # GET /questions.json
  def index
    @questions = Question.all
  end

  # GET /questions/1
  # GET /questions/1.json
  #def show
  #end

  # GET /questions/new
  def new
    @question = Question.new
  end

  # GET /questions/1/edit
  def edit
  end

  # POST /questions
  # POST /questions.json
  def create
    @question = Question.new(question_params)

    respond_to do |format|
      if @question.save
        format.html { redirect_to @question, notice: 'Question was successfully created.' }
        format.json { render action: 'show', status: :created, location: @question }
      else
        format.html { render action: 'new' }
        format.json { render json: @question.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /questions/1
  # PATCH/PUT /questions/1.json
  def update
    respond_to do |format|
      if @question.update(question_params)
        format.html { redirect_to @question, notice: 'Question was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @question.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /questions/1
  # DELETE /questions/1.json
  def destroy
    @question.destroy
    respond_to do |format|
      format.html { redirect_to questions_url }
      format.json { head :no_content }
    end
  end

  def show
    require 'date'
    #response = HTTParty.get("http://api.stackexchange.com/2.2/questions?order=desc&sort=activity&tagged=openshift&site=stackoverflow&key=CtNgNzn5roqeORLJZ8ONGA((&client_id=2825")
    @response = HTTParty.get("http://api.stackexchange.com/2.2/questions?pagesize=100&order=desc&sort=activity&tagged=openshift&site=stackoverflow&filter=!azbR8FUu4hw05X&key=CtNgNzn5roqeORLJZ8ONGA((&client_id=2825&run=true")

    json_string = @response.body
    json_obj = JSON.parse(json_string)

    puts json_obj['items']

    json_obj['items'].each do |q|
      #answers = HTTParty.get("http://api.stackexchange.com/2.2/questions/#{q['question_id']}/answers?order=desc&sort=activity&site=stackoverflow&key=CtNgNzn5roqeORLJZ8ONGA((&client_id=2825")

      #answer_string = answers.body
      #answer_obj = JSON.parse(answer_string)

      #puts '******************'
      #puts answer_obj

      @question = Question.new(
        :tag => q['tags'],
        :owner => q['owner'],
        :answers => q['answers'],
        :is_answered => q['is_answered'],
        :view_count => q['view_count'],
        :answer_count => q['answer_count'],
        :score => q['score'],
        :last_activity_date => q['last_activity_date'],
        :creation_date => Time.at(q['creation_date']).to_datetime,
        :simple_creation_date => Time.at(q['creation_date']).to_datetime.strftime("%F"),
        #:simple_creation_date => DateTime.strptime((q['creation_date']).to_i.to_s,'%s').strftime("%m-%d-%Y"),
        #Date.strptime((q['creation_date']), "%m-%d-%Y"),
        :last_edit_date => q['last_edit_date'],
        :question_id => q['question_id'],
        :link => q['link'],
        :title => q['title']
      )
     @question.save

    end


    respond_to do |format|
      if @question.save
        format.html { redirect_to stats_url flash notice: 'Questions were successfully pulled.' }
        format.json { render action: 'show', status: :created, location: @question }
      else
        format.html { render action: 'new' }
        format.json { render json: @question.errors, status: :unprocessable_entity }
      end
    end
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_question
      #@question = Question.find_by(params[:question_id])
      #@question = Question.find_by(params[:title])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def question_params
      params.require(:question).permit(:tag, :owner, :is_answered, :view_count, :answer_count, :score, :last_activity_date, :creation_date, :last_edit_date, :question_id, :link, :title)
    end
end
