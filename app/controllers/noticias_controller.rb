class NoticiasController < ApplicationController
  
  def show
    @noticia = Noticias.find(params[:id])
    
  end

  def create
    Noticias.create(:titulo => params[:noticias][:titulo], 
                        :resumen => params[:noticias][:resumen],
                        :contenido => params[:noticias][:contenido],
                        :portada => params[:noticias][:portada],
                        :imagen => params[:noticias][:imagen],
                        :tags => params[:noticias][:tags],
                        :dateCreated => DateTime.now)
  end

  def new
    @noticias = Noticias.new
  end

  def edit    
    
  end

  def update
    noticia = Noticias.find(params[:noticias][:id])

    noticia.update(:titulo => params[:noticias][:titulo], 
    :resumen => params[:noticias][:resumen],
    :contenido => params[:noticias][:contenido],
    :portada => params[:noticias][:portada],
    :imagen => params[:noticias][:imagen],
    :tags => params[:noticias][:tags],
    :dateUpdated => DateTime.now)

    redirect_to adminnoticias_path
  end

  def reload_noticias
    @noticias = Noticias.where("date >= ? and date <= ?" , DateTime.parse(params[:date]).beginning_of_day, DateTime.parse(params[:date]).end_of_day)
    respond_to do |format|
  
      format.html { render :partial => "noticias/partials/tablaNoticias", locals: {trabajos: @trabajos, date: DateTime.parse(params[:date])} }
  
    end
  end
end
