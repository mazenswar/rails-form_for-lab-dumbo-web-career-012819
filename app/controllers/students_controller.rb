class StudentsController < ApplicationController
  def index
    @students = Student.all
  end

  def show
    get_student
  end

  def new
    @student = Student.new
  end

  def create
    @student = Student.create(student_params)
    redirect_to student_path @student
  end

  def edit
    get_student
  end

  def update
    get_student.update(student_params)
    redirect_to student_path @student
  end

private
  def get_student
    @student = Student.find(params[:id])
  end

  def student_params
    params.require(:student).permit(:first_name, :last_name, :id)
  end

end
