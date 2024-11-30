using Camera.MAUI;
using CheckInOutCGA.ViewModel;
using Microsoft.Extensions.Logging;
using Plugin.Maui.Audio;
using Microsoft.Maui.Controls.Maps;
using ZXing.Net.Maui;
namespace CheckInOutCGA;

public static class MauiProgram
{
	public static MauiApp CreateMauiApp()
	{
        

		var builder = MauiApp.CreateBuilder();
		builder
			
			.UseMauiApp<App>()
			//.UseBarcodeReader()
			.UseMauiCameraView()
			.UseMauiMaps()
			.ConfigureEssentials(essentials =>
			{
				essentials.UseVersionTracking();
			})
			.ConfigureFonts(fonts =>
				{
					fonts.AddFont("OpenSans-Regular.ttf", "OpenSansRegular");
					fonts.AddFont("OpenSans-Semibold.ttf", "OpenSansSemibold");
					fonts.AddFont("MADE Tommy Soft Bold.ttf" , "SoftBold");
					fonts.AddFont("MADE Tommy Soft Medium.ttf","SoftMedium");
					fonts.AddFont("MADE Tommy Soft Regular.ttf","SoftRegular");
					
					//fonts.AddFont("MADE Tommy Soft Medium.otf", "OpenSansMedium");
					
				});
		
#if DEBUG
        builder.Logging.AddDebug();
		builder.Services.AddSingleton(AudioManager.Current);
		builder.Services.AddTransient<ChecadorViewModel>();
#endif

		return builder.Build();
	}
}

