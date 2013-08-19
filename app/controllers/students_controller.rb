class StudentsController < ApplicationController
  def index
    @title = "List Students"
    @students = Student.all
  end

  def show
    @title = "Show Student"
    @student = Student.find(params[:id])
  end

  def new
    @title = "New Student"
    @student = Student.new
  end

  def create
    @student = Student.new(params[:student])
    if @student.save
      redirect_to @student, :notice => "Successfully created student."
    else
      render :action => 'new'
    end
  end

  def edit
    @title = "Edit Student"
    @student = Student.find(params[:id])
  end

  def update
    @student = Student.find(params[:id])
    if @student.update_attributes(params[:student])
      redirect_to @student, :notice  => "Successfully updated student."
    else
      render :action => 'edit'
    end
  end

  def destroy
    @student = Student.find(params[:id])
    @student.destroy
    redirect_to students_url, :notice => "Successfully destroyed student."
  end
end
