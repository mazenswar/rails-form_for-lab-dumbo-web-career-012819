class SchoolClassesController < ApplicationController

  def index
    @school_classes = SchoolClass.all
  end

  def show
    get_class
  end

  def new
    @school_class = SchoolClass.new
  end

  def create
    @school_class = SchoolClass.create(class_params)
    redirect_to school_class_path @school_class
  end

  def edit
    get_class
  end

  def update
    get_class.update(class_params)
    redirect_to school_class_path @school_class
  end

  private

  def get_class
    @school_class = SchoolClass.find(params[:id])
  end

  def class_params
    params.require(:school_class).permit(:title, :room_number)
  end

end
