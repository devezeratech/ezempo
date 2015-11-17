module ApplicationHelper

    def public_static_path(path, options = nil)
      root_path(options) + path
    end

    def time_hours(time)
      time.strftime("%H:%M %p")
    end
    
end
