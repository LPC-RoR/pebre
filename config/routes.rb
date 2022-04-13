Rails.application.routes.draw do

  resources :tandas
  resources :reservaciones
  resources :detalle_reservas
  resources :mesas do 
    match :reservar, via: :get, on: :member
  end
  resources :cierres
  resources :reservas do
    match :confirmacion, via: :get, on: :member
    match :reservas_cerradas, via: :get, on: :member
    match :reservacion, via: :get, on: :collection
    match :dia_reserva, via: :get, on: :collection
    match :elige_dia, via: :post, on: :collection
  end
  resources :items
  resources :grupos do
    resources :items
  end
  resources :areas
  resources :proyectos do
    resources :areas
  end
  scope module: 'aplicacion' do
    resources :app_administradores
    resources :app_nominas
    resources :app_perfiles do
      # recurso SOLO si hay manejo de ESTADOS
      resources :st_perfil_modelos
      match :desvincular, via: :get, on: :member
    end
    resources :app_observaciones
    resources :app_mejoras

    resources :app_recursos do
      collection do
        match :ayuda, via: :get
        match :home, via: :get
        match :administracion, via: :get
        match :procesos, via: :get
      end
    end

    resources :app_imagenes
    resources :app_contactos
    resources :app_mensajes do
      match :respuesta, via: :post, on: :collection
      match :estado, via: :get, on: :member
    end
    resources :app_msg_msgs

    resources :app_documentos
    resources :app_dir_dires
    resources :app_directorios do
      match :nuevo, via: :post, on: :collection
    end
    resources :app_repos do
      match :publico, via: :get, on: :collection
      match :perfil, via: :get, on: :collection
    end
    resources :app_archivos

    resources :app_enlaces

  end

  scope module: 'home' do
    resources :h_imagenes
    resources :h_links
    resources :h_temas
  end
  
  scope module: 'sidebar' do
    resources :sb_elementos
    resources :sb_listas do
      resources :sb_elementos
    end
  end


  # SCOPE HELP
  scope module: 'help' do
    resources :hlp_pasos
    resources :hlp_tutoriales do
      resources :hlp_pasos
    end

#    resources :conversaciones
    resources :mensajes do 
      match :estado, via: :get, on: :member
      match :respuesta, via: :post, on: :collection
    end
    resources :pasos
    resources :tema_ayudas do
      resources :tutoriales
    end
    resources :tutoriales do
      resources :pasos
    end
  end

  scope module: 'estados' do
    resources :st_estados do
      match :asigna, via: :get, on: :member
    end
    resources :st_modelos do 
      resources :st_estados
      match :asigna, via: :get, on: :member
    end
    resources :st_perfil_estados do
      match :desasignar, via: :get, on: :member
      match :cambia_rol, via: :get, on: :member
    end
    resources :st_perfil_modelos do
      resources :st_perfil_estados
      match :desasignar, via: :get, on: :member
      match :cambia_rol, via: :get, on: :member
      match :cambia_ingreso, via: :get, on: :member
    end
    resources :st_bandejas
  end

  devise_for :usuarios

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'aplicacion/app_recursos#home'

end
