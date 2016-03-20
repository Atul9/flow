module UI
  class Navigation
    attr_reader :root_screen

    def initialize(root_screen)
      root_screen.navigation = self
      @root_screen = root_screen
      @current_screens = [@root_screen]
    end

    def show_bar
      proxy.setNavigationBarHidden(false)
    end

    def hide_bar
      proxy.setNavigationBarHidden(true)
    end

    def title=(title)
      @current_screens.last.proxy.title = title
    end

    def bar_color=(color)
      proxy.navigationBar.barTintColor = UI::Color(color).proxy
    end

    def proxy
      @proxy ||= UINavigationController.alloc.initWithRootViewController(@root_screen.proxy)
    end

    def push(screen, animated=true)
      @current_screens << screen
      screen.navigation = self
      proxy.pushViewController(screen.proxy, animated: animated)
    end

    def pop(animated=true)
      screen = @current_screens.pop
      proxy.popViewControllerAnimated(animated)
      screen
    end
  end
end
