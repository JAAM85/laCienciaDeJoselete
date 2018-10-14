class ControlsController < ApplicationController
  
  def show
    
  end
  def create
    Control.create(:asignatura => params[:control][:asignatura], 
                        :descripcion => params[:control][:descripcion],
                        :fecha => params[:control][:fecha])

    redirect_to curso_path(Asignatura.find(params[:control][:asignatura]).curso)
  end

  def new
    @control = Control.new
    @asignaturas = Asignatura.where("curso=?",params[:c])
  end
end
