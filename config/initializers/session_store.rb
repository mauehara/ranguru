# Be sure to restart your server when you modify this file.

Ranguru::Application.config.session_store :active_record_store

module ActionDispatch
	module Routing
		class RouteSet
			def inspect
				"nothing to see here"
			end
		end
	end
end