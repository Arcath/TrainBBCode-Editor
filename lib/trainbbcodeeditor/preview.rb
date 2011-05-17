class TBBC
	class Editor
	    
	    JS_ESCAPE_MAP = ActionView::Helpers::JavaScriptHelper::JS_ESCAPE_MAP
	    
		def preview(request)
			parsed = request.params.first.last.tbbc
			[200, {"Content-Type" => "text/javascript"},"$('#tbbce_frame').html(\"#{escape_javascript(parsed)}\");"]
		end
		
		def escape_javascript(javascript)
		    #javascript.gsub(/(\\|<\/|\r\n|[\r\n"'])/) { JS_ESCAPE_MAP[$1] }
		    javascript
	    end
	end
end
