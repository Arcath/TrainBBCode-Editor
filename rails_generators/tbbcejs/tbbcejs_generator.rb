class Tbbcejs < Rails::Generator::Base
	def manifest
		record do |m|
			m.file "tbbce.js", "public/javascripts/tbbce.js"
			m.file "jquery.fieldselection.js", "public/javascripts/jquery.fieldselection.js"
			m.file "index.js.erb", "app/views/tbbce/index.js.erb"
			m.file "tbbce_controller.js", "app/controllers/tbbce_controller.js"
		end
	end
end
