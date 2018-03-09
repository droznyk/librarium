class LibrariesController < ApplicationController
  before_action :fetch_library, only: %w[show edit destroy]

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

end
