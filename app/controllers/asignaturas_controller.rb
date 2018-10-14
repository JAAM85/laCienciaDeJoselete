class AsignaturasController < ApplicationController
  
  def show
    @curso = Curso.find(Asignatura.find(params[:id]).curso)
    @asignatura = Asignatura.find(params[:id])
    @temas = Tema.where("asignatura=?", params[:id])
  end
end
