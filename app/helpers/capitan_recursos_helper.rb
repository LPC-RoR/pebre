module CapitanRecursosHelper
	## ------------------------------------------------------- GENERAL

	def app_setup
		{
			nombre: 'Appname',
			home_link: 'http://www.appname.cl',
			logo_navbar: 'logo_navbar.gif'
		}
	end

	def image_size
		{
			portada: nil,
			tema: 'half',
			foot: 'half'
		}
	end

	def font_size
		{
			title: 4,
			title_tema: 1,
			detalle_tema: 6
		}
	end

	def app_color
		{
			app: 'primary',
			navbar: 'primary',
			help: 'dark',
			data: 'success',
			title_tema: 'primary',
			detalle_tema: 'primary'
		}
	end

	def image_class
		{
			portada: img_class[:centrada],
			image_tema: img_class[:centrada],
			foot: img_class[:centrada]
		}
	end

	## ------------------------------------------------------- LAYOUTS CONTROLLERS

	def app_sidebar_controllers
		[
		]
	end

	def app_bandeja_controllers
		[
		]
	end

	## ------------------------------------------------------- SCOPES & PARTIALS

	def app_controllers_scope
		{
		}
	end

	def app_scope_controller(controller)
		nil
	end

	## ------------------------------------------------------- TABLA | BTNS

	def sortable_fields
		{
			'controller' => ['campo1', 'campo2']
		}
	end

	# En modelo.html.erb define el tipo de fila de tabla
	# Se usa para marcar con un color distinto la fila que cumple el criterio
	def table_row_type(objeto)
		'default'
	end

	def app_alias_tabla(controller)
		controller
	end

	def app_new_button_conditions(controller)
		if [].include?(controller)
			admin?
		else
			true
		end
	end

	def app_crud_conditions(objeto, btn)
		if [].include?(objeto.class.name)
			admin?
		else
			case objeto.class.name
			when 'Clase'
				admin?
			else
				true
			end
		end
	end

	def show_link_condition(objeto)
		# usado para condicionar el uso de campos show en tablas
		true
	end

	## ------------------------------------------------------- SHOW

	# Método de apoyo usado en get_new_link (abajo)
	def app_show_title(objeto)
		case objeto.class.name
		when 'Class'
			objeto.titulo
		else
			objeto.send(objeto.class.name.tableize.singularize)
		end
	end
end