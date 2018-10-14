class TemasController < ApplicationController
  
  def show   
    @tema = Tema.find(params[:id])
    @actividades = Actividad.where("tema =?", params[:id])
  end

  def create
    Tema.create(:asignatura => params[:tema][:asignatura], 
                        :descripcion => params[:tema][:descripcion],
                        :imagen => params[:tema][:imagen],
                        :titulo => params[:tema][:titulo])

    redirect_to asignatura_path(params[:tema][:asignatura])
  end

  def new
    @tema = Tema.new
    @asignaturas = Asignatura.all
  end

  def update
    tema = Tema.find(params[:id])
    tema.update(:asignatura => params[:tema][:asignatura], 
                        :descripcion => params[:tema][:descripcion],
                        :imagen => params[:tema][:imagen],
                        :titulo => params[:tema][:titulo])

    flash[:notice] = "Guardado con éxito" 

    redirect_to admintemas_path
                    

  end

end
