class AdminController < ApplicationController

    before_action :autenticado

    def index

    end

    def autenticado
        if (!user_signed_in?)
            flash[:error] = "Debe estar autenticado."
            redirect_to :root
        end            
    end
    
    def temas
        @temas = Tema.all
    end

    def trabajos
        @trabajos = Trabajocasa.all
    end

    def actividades
        @actividades = Actividad.all
    end

    def noticias
        @noticias = Noticias.all
    end

    def render_temas
        @tema = Tema.find(params[:tema])
        @asignaturas = Asignatura.all
        respond_to do |format|
            format.html { render :partial => "admin/partials/editTema", locals: {tema: @tema, asignaturas: @asignaturas } }
        end
    end

    def controles
        @controles = Control.all
    end

    def render_control
        @control = Control.find(params[:control])
        @asignaturas = Asignatura.all
        respond_to do |format|
            format.html { render :partial => "admin/partials/editControl", locals: {tema: @tema, asignaturas: @asignaturas } }
        end
    end

    def render_actividades
        @actividad = Actividad.find(params[:actividad])
       
        @temas = Tema.joins("INNER JOIN asignaturas ON asignaturas.id=temas.asignatura")
        .joins("INNER JOIN cursos ON cursos.id=asignaturas.curso")
        .where("asignaturas.curso=?", 5)

        respond_to do |format|
            format.html { render :partial => "admin/partials/editActividad", locals: {actividad: @actividad, asignaturas: @asignaturas } }
        end
    end

    def render_trabajo
        @t = Trabajocasa.find(params[:trabajo])
        @asignaturas = Asignatura.all
        respond_to do |format|
            format.html { render :partial => "admin/partials/editTrabajo", locals: {trabajo: @t, asignaturas: @asignaturas } }
        end
    end

    def render_noticia
        @t = Noticias.find(params[:noticia])
        respond_to do |format|
            format.html { render :partial => "admin/partials/editNoticia", locals: {noticia: @t} }
        end
    end

    def deleteActividad
        @actividad = Actividad.find(params[:id])
        @actividad.destroy
    end

    def deleteTema
        @tema = Tema.find(params[:id])
        @tema.destroy
    end

    def deleteControl
        @control = Control.find(params[:id])
        @control.destroy
    end
    
    def deleteTrabajo
        @t = Trabajocasa.find(params[:id])
        @t.destroy
    end

    def deleteNoticia
        @t = Noticias.find(params[:id])
        @t.destroy
    end


    

end