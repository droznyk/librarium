class LibrariesController < ApplicationController
  before_action :fetch_library, only: %i[show edit update destroy]
  before_action :is_owner?, only: %i[edit update destroy]

  def index
    @libraries = Library.all
  end

  def new
    @library = Library.new
  end

  def create
    @library = Library.new(library_params)
    if @library.save
      redirect_to library_path(@library), 
        notice: "Library has been created successfully!"
    else
      flash[:error] = @library.errors.full_messages
      render :new
    end
  end

  def show; end

  def edit; end

  def update
    if @library.update(library_params)
      flash[:notice] = "#{@library.name} has been updated successfully!"
      redirect_to library_path(@library)
    else
      flash[:error] = @library.errors.full_messages
      render :edit
    end
  end

  def destroy
    flash[:notice] = "#{@library.name.capitalize} has been destroyed successfully!"
    @library.destroy
    redirect_to libraries_path
  end

  private

  def library_params
    params.require(:library).permit(:name, :description)
  end

  def fetch_library
    @library = Library.find(params[:id])
  end

  def is_owner?
    unless current_user == @library.user
      flash[:error] = 'You are not a owner!'
      redirect_to root_path
    end
  end
end
