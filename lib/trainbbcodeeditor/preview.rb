class TBBC
	class Editor
		def preview(request)
			parsed = request.params.first.first.tbbc.gsub('"','\"')
			[200, {"Content-Type" => "text/javascript"},"$('#tbbce_frame').html(\"#{parsed}\");"]
		end
	end
end
