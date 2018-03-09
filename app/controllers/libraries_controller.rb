class LibrariesController < ApplicationController

  def index
    @libraries = Library.all
  end

  def new
    @library = Library.new
  end

  def create
    @library = Library.new(library_params)
    if @library.save
      redirect_to libraries_path, 
        notice: "Library has been created successfully!", method: :get
    else
      flash[:error] = @library.errors.full_messages
      render :new
    end
  end

  private

  def library_params
    params.require(:library).permit(:name, :description)
  end

end
