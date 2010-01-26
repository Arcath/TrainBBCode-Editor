class Tbbcejs < Rails::Generator::Base
	def manifest
		record do |m|
			#Controller and Javascripts
			m.file "tbbce.js", "public/javascripts/tbbce.js"
			m.file "jquery.fieldselection.js", "public/javascripts/jquery.fieldselection.js"
			m.directory "app/views/tbbce"
			m.file "index.js.erb", "app/views/tbbce/index.js.erb"
			m.file "tbbce_controller.js", "app/controllers/tbbce_controller.js"
			#Icons
			m.directory "public/images/tbbce"
			Dir.foreach("icons") do |f|
				if f != "." && f != ".." then
					m.file "icons/#{f}", "public/images/tbbce/#{f}"
				end
			end
		end
	end
end
