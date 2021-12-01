Rails.application.routes.draw do
  resources :st_logs
  resources :st_bandejas
  resources :st_perfil_estados
  resources :st_estados
  resources :st_modelos
  resources :hlp_pasos
  resources :hlp_tutoriales
  resources :sb_elementos
  resources :sb_listas
  resources :h_links
  resources :h_temas
  resources :h_imagenes
  resources :app_enlaces
  resources :app_archivos
  resources :app_documentos
  resources :app_dir_dires
  resources :app_directorios
  resources :app_repos
  resources :app_msg_msgs
  resources :app_mensajes
  resources :app_contactos
  resources :app_imagenes
  resources :app_recursos
  resources :app_mejoras
  resources :app_observaciones
  resources :app_perfiles
  resources :app_nominas
  resources :app_administradores

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

  devise_for :usuarios
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
