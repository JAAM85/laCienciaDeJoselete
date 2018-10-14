class CursosController < ApplicationController
  def new
  end

  def create
  end
  
  def show
    @curso = Curso.find(params[:id])
    @controles = Control.
      joins("INNER JOIN asignaturas ON asignaturas.id=controls.asignatura").
      where("asignaturas.curso=? and controls.fecha >= ?", params[:id], DateTime.now.beginning_of_day).
      order("controls.fecha")
  end
end
