using CheckInOutCGA.View;

namespace CheckInOutCGA;

public partial class App : Application
{
    public App()
    {
        InitializeComponent();

        AppDomain.CurrentDomain.UnhandledException += (sender, args) =>
        {Console.WriteLine($"Unhandled exception: {args.ExceptionObject}");};

        TaskScheduler.UnobservedTaskException += (sender, args) =>
        {Console.WriteLine($"Unobserved exception: {args.Exception}");
            args.SetObserved();};
            
        Helpers.Settings.Obtenerversion();
        MainPage = new NavigationPage(new LoginPage());
    }
    protected override void OnStart()
    {
        OnResume();
    }

    protected override void OnSleep()
    {
        Helpers.Theme.SetTheme();
        RequestedThemeChanged -= App_RequestedThemeChanged;
        Helpers.Settings.Obtenerversion();
    }

    protected override void OnResume()
    {
        Helpers.Theme.SetTheme();
        RequestedThemeChanged += App_RequestedThemeChanged;
        Helpers.Settings.Obtenerversion();
    }

    private void App_RequestedThemeChanged(object? sender, AppThemeChangedEventArgs e)
    {
        MainThread.BeginInvokeOnMainThread(() =>
        {
            Helpers.Theme.SetTheme();
        });
    }


}

