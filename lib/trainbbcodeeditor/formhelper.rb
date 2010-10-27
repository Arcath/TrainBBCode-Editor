class ActionView::Helpers::FormBuilder
	def tbbce(conf)
		out="<div id=\"tbbce_bar\">You do not have Javascript Enabled</div>"
		out+=text_area conf, :class => 'tbbce_area'
		out+="<div id=\"tbbce_frame\"></div>"
		out+="<script src=\"/tbbce_handler/jquery.field_selection.js?#{Time.now.to_i}\" type=\"text/javascript\"></script>"
		out+="<script src=\"/tbbce_handler/tbbce.js?#{Time.now.to_i}\" type=\"text/javascript\"></script>"
		return out.html_safe
	end
end
