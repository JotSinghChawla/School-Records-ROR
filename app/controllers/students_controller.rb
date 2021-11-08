class StudentsController < ApplicationController
  before_action :set_student, only: %i[ show edit update destroy ]
  before_action :authenticate_user!
  before_action :before_update_logger
  after_action :after_update_logger

  # GET /students or /students.json
  def index
    @students = Student.paginate(page: params[:page])

    logger.info "\n\n Admin= #{current_user.email} \n\n"

    respond_to do |format|
      format.html
      format.json { render json: @students }
      format.xml { render xml: @students.as_json }
    end
  end
  
  def total
    @students = Student.all
  end
  
  def first
    @students = Student.all
  end

  # GET /students/1 or /students/1.json
  def show
  end

  # GET /students/new
  def new
    @student = Student.new
  end

  # GET /students/1/edit
  def edit
  end

  # POST /students or /students.json
  def create
    @student = Student.new(student_params)

    respond_to do |format|
      if @student.save
        
        if @student.marks1 < 40 || @student.marks2 < 40 || @student.marks3 < 40
          NotifyFailMailer.alert_admin(@student).deliver
        end

        format.html { redirect_to @student, notice: "Student was successfully created." }
        format.json { render :show, status: :created, location: @student }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @student.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /students/1 or /students/1.json
  def update
    respond_to do |format|
      if @student.update(student_params)
        format.html { redirect_to @student, notice: "Student was successfully updated." }
        format.json { render :show, status: :ok, location: @student }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @student.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /students/1 or /students/1.json
  def destroy
    @student.destroy
    respond_to do |format|
      format.html { redirect_to students_url, notice: "Student was successfully destroyed." }
      format.json { head :no_content }
    end
  end 

  def before_update_logger
    logger.info "==============before_action from Student controller is working fine=============="
  end

  def after_update_logger
    logger.info  "==============after_action from Student controller is working fine=============="
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_student
      @student = Student.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def student_params
      params.require(:student).permit(:name, :age, :marks1, :marks2, :marks3, :student_class_id, :rollnumber)
    end
    
end
