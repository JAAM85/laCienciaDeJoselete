Rails.application.routes.draw do  

  root to: 'visitors#index'
  devise_for :users
  resources :users
  resources :cursos
  resources :asignaturas
  resources :actividads,  :except => :show
  resources :noticias  
  resources :controls
  resources :temas
  resources :trabajocasas
  resources :actividads

  get '/trabajocasas/new/:c', to: 'trabajocasas#new', as: 'trabajocasas_new'
  get '/controls/new/:c', to: 'controls#new', as: 'controls_new'
  get '/trabajos/new/:c', to: 'trabajos#new', as: 'trabajos_new'
  get '/admin', to: 'admin#index', as: 'admin'  
  get '/actividades/:id', to: 'actividads#index', as: 'actividades_curso'

  
  get '/admin/temas', to: 'admin#temas', as: 'admintemas'
  get '/admin/actividades', to: 'admin#actividades', as: 'adminactividades'
  get '/admin/controles', to: 'admin#controles', as: 'admincontroles'
  get '/admin/trabajos', to: 'admin#trabajos', as: 'admintrabajos'
  get '/admin/noticias', to: 'admin#noticias', as: 'adminnoticias'

  post '/reload_trabajos', to: 'trabajocasas#reload_trabajos', as: 'reload_trabajos'
  post '/edit_tema', to: 'admin#render_temas', as: 'tema_edit'
  post '/edit_actividad', to: 'admin#render_actividades', as: 'actividad_edit'
  post '/edit_control', to: 'admin#render_control', as: 'control_edit'
  post '/edit_trabajo', to: 'admin#render_trabajo', as: 'trabajo_edit'  
  post '/edit_noticia', to: 'admin#render_noticia', as: 'noticia_edit'
  post '/delete_control', to: 'admin#deleteControl', as: 'control_delete'  
  post '/delete_actividad', to: 'admin#deleteActividad', as: 'actividad_delete'  
  post '/delete_trabajo', to: 'admin#deleteTrabajo', as: 'trabajo_delete' 
  post '/delete_tema', to: 'admin#deleteTema', as: 'tema_delete'  
  post '/delete_noticia', to: 'admin#deleteNoticia', as: 'noticia_delete'  
  
  post '/reload_links', to: 'actividads#reload_links', as: 'reloadLinks'
  post '/upload_image' => 'upload#upload_image', :as => :upload_image

  patch '/noticias', to: 'noticias#update', as: 'update_noticia'
end
