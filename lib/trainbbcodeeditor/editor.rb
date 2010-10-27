class TBBC
	class Editor
		def initialize
			@tbbc=TBBC.new
			@config = @tbbc.config_hash_return
		end

		def javascript
			if @config[:tbbce_bg_color] then
				bg_col = "\"#{@config[:tbbce_bg_color]}\""
			else
				bg_col = "$('body').css(\"background-color\")"
			end
			if @config[:tbbce_text_color] then
				t_col = "\"#{@config[:tbbce_text_color]}\""
			else
				t_col = "$('body').css(\"color\")"
			end
			[200, {"Content-Type" => "text/javascript"},return_file("javascript/tbbce.js").gsub(/<%BGCOL%>/,bg_col).gsub(/<%TCOL%>/,t_col)]
		end

		def jqfs
			[200, {"Content-Type" => "text/javascript"},return_file("javascript/jquery.fieldselection.js")]
		end

		def icon(path)
			[200, {"Content-Type" => "image/png"},return_file(path.gsub(/\/tbbce_handler/,''))]
		end

		private

		def return_file(file)
			file_path = File.dirname(__FILE__).gsub(/lib\/trainbbcodeeditor/,"for_rack/") + file 
			f=File.new(file_path)
			out=""
			f.readlines.map { |line| out += line }
			out
		end
	end
end
