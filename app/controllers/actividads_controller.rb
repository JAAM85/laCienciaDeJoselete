class ActividadsController < ApplicationController

  def index
    if params[:id].nil?
      @actividades = Actividad.all
    else
      @actividades = Actividad.joins("INNER JOIN temas ON temas.id=actividads.tema")
    .joins("INNER JOIN asignaturas ON asignaturas.id=temas.asignatura")
    .joins("INNER JOIN cursos ON cursos.id=asignaturas.curso")
    .where("asignaturas.curso=?", params[:id])
    end

    
  end
    
  def show   
    @actividad = Actividad.find(params[:id])
    
  end

  def create
    Actividad.create(:tema => params[:actividad][:tema], 
                        :descripcion => params[:actividad][:descripcion],
                        :titulo => params[:actividad][:titulo],
                        :imagen => params[:actividad][:imagen],
                        :link => params[:actividad][:link])

    flash[:success] = "Se ha creado la nueva actividad."                    
    redirect_to adminactividades_path
  end

  def update
    actividad = Actividad.find(params[:id])
    actividad.update(:tema => params[:actividad][:tema], 
      :descripcion => params[:actividad][:descripcion],
      :titulo => params[:actividad][:titulo],
      :imagen => params[:actividad][:imagen],
      :link => params[:actividad][:link])

    flash[:success] = "Se ha actualizado la actividad."
    
    redirect_to adminactividades_path
  end


  def new
    @actividad = Actividad.new
    @asignaturas = Asignatura.all
    @temas = Tema.all
  end

  def reload_links    
    respond_to do |format|
      format.html { render :partial => "admin/partials/linksActividad", locals: {id: params[:id] } }
    end
  end
end
