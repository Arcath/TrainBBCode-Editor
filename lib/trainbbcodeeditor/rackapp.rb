class TBBC
	class Editor
		class Middleware
			def initialize(app)
				@app = app
			end

			def call(env)
				@status, @headers, @response = @app.call(env)
				@req = Rack::Request.new(env)
				response
			end

			def response
				if @req.path == "/tbbce_handler/tbbce.js"
					return TBBC::Editor.new.javascript
				elsif @req.path == "/tbbce_handler/jquery.field_selection.js"
					return TBBC::Editor.new.jqfs
				elsif @req.path =~ /\/tbbce_handler\/preview.js/
					return TBBC::Editor.new.preview(@req)
				elsif @req.path =~ /\/tbbce_handler\/icons\//
					return TBBC::Editor.new.icon(@req.path)
				else
					return [@status,@headers,@response]
				end
			end
		end
	end
end
