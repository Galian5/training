class TrainingsController < ApplicationController

  def index
    @trainings = Training.all
  end

  def new
    @training = Training.new
    1.times { @training.exercises.build}
  end

  def create
    @training = Training.new(training_params)
    if @training.save
      redirect_to root_path
    else
      render :new
    end
  end

  def edit
    @training = Training.find(params[:id])
  end

  def update
    @training = Training.find(params[:id])

    if @training.update_attributes(training_params)
      redirect_to training_path(@training)
    else
      render :edit
    end
  end

  def show
    @training = Training.find(params[:id])
  end

  private

  def training_params
    params.require(:training).permit(:title, :body, :image, :image_cache,
                                     exercises_attributes: [:name, :series, :repetitions, :_destroy])
  end

end
