class AppDelegate
  def application(application, didFinishLaunchingWithOptions:launchOptions)
    web_view = UIWebView.alloc.init
    web_view.didFinishLoadBlock = lambda { |web_view| }
    true
  end
end
