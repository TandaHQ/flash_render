module FlashRender
  def render(*args)
    options = args.extract_options!

    if (alert = options.delete(:alert))
      flash.now[:alert] = alert
    end

    if (notice = options.delete(:notice))
      flash.now[:notice] = notice
    end

    if (other_flashes = options.delete(:flash))
      other_flashes.each do |key, value|
        flash.now[key] = value
      end
    end

    args << options
    super(*args)
  end
end

unless defined?(Rails::Railtie)
  ActionController::Base.prepend(FlashRender)
end
