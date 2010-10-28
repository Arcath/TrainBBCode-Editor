class TBBC
	class Editor
		def build_tbbce_js
			@raw = return_file("javascript/tbbce.js")
			rawgsub(/<%BGCOL%>/,"\"#{@config[:tbbce_bg_color]}\"") if @config[:tbbce_bg_color]
			rawgsub(/<%BGCOL%>/,"$('body').css(\"background-color\")") unless @config[:tbbce_bg_color]
			rawgsub(/<%TCOL%>/,"\"#{@config[:tbbce_text_color]}\"") if @config[:tbbce_text_color]
			rawgsub(/<%TCOL%>/,"$('body').css(\"color\")") unless @config[:tbbce_text_color]
			return @raw
		end

		def rawgsub(a,b)
			@raw = @raw.gsub(a,b)
		end
	end
end
