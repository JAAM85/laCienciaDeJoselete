class TrabajocasasController < ApplicationController
  
  def show
    @curso = Curso.find(params[:id])
    trabajos = Trabajocasa.joins("INNER JOIN asignaturas ON asignaturas.id = trabajocasas.asignatura").where("asignaturas.curso=?",@curso.id)
    @trabajos = Trabajocasa.where("date >= ? and date <= ?" , DateTime.now.beginning_of_day, DateTime.now.end_of_day)

  end

  def create
    Trabajocasa.create(:titulo => params[:trabajocasa][:titulo], 
                        :descripcion => params[:trabajocasa][:descripcion],
                        :asignatura => params[:trabajocasa][:asignatura],
                        :notas => params[:trabajocasa][:notas],
                        :date => DateTime.now)
  end

  def new
    @trabajo = Trabajocasa.new
    @asignaturas = Asignatura.where("curso=?",params[:c])
  end

  def edit
  end

  def reload_trabajos
    @trabajos = Trabajocasa.where("date >= ? and date <= ?" , DateTime.parse(params[:date]).beginning_of_day, DateTime.parse(params[:date]).end_of_day)
    respond_to do |format|
  
      format.html { render :partial => "trabajocasas/partials/tablaTrabajo", locals: {trabajos: @trabajos, date: DateTime.parse(params[:date])} }
  
    end
  end

end
