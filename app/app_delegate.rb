

    class DelegateThing
      def webViewDidStartLoad(webView)
        puts 'STARTING LOAD'
      end

      def webView(webView, shouldStartLoadWithRequest:request, navigationType:navigationType)
        puts "SHOULD LOAD"
        true
      end

      def webViewDidFinishLoad(webView)
        puts "DID LOAD"
      end
    end

class AppDelegate
  def application(application, didFinishLaunchingWithOptions:launchOptions)
    @web_view = UIWebView.alloc.initWithFrame(CGRectMake(0,0,100,100))
    @window = UIWindow.alloc.initWithFrame(UIScreen.mainScreen.bounds)
    @window.makeKeyAndVisible
    @window.addSubview(@web_view)
    # as_ivar
    # Crashes the app
    inline
    @web_view.loadRequest(NSURLRequest.requestWithURL(NSURL.URLWithString("https://google.com/")))

    true
  end

  def as_ivar
    @delegate = DelegateThing.new
    @web_view.delegate = @delegate
  end

  def inline
    @web_view.delegate = DelegateThing.new
  end
end
