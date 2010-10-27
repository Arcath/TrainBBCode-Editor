class TBBC
	class Editor
		def preview(request)
			parsed = request.params["string"].tbbc.gsub(/-nl-/,"<br />").gsub('"','\"')
			[200, {"Content-Type" => "text/javascript"},"$('#tbbce_frame').html(\"#{parsed}\");"]
		end
	end
end
