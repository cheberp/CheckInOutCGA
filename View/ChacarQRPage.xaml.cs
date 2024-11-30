using Camera.MAUI;
using CheckInOutCGA.ViewModel;

namespace CheckInOutCGA.View;

public partial class ChacarQRPage : ContentPage
{
    
	public ChacarQRPage()
	{
		InitializeComponent();
		BindingContext = new ChecarQRViewModel(Navigation);
        //camview.CamerasLoaded += camview_CamerasLoaded;
        //camview.BarcodeDetected += camview_BarcodeDetected;
    }

    private void camview_CamerasLoaded(System.Object sender, System.EventArgs e)
    {
        
        if(camview.Cameras.Count > 0)
        {
            camview.Camera = camview.Cameras.First();
            MainThread.BeginInvokeOnMainThread(async () =>
            {
                await camview.StopCameraAsync();
                await camview.StartCameraAsync();
            });
        }
    }

    void camview_BarcodeDetected(System.Object sender, Camera.MAUI.ZXingHelper.BarcodeEventArgs args)
    {
        MainThread.BeginInvokeOnMainThread(() =>
        {


            BrResult.Text = $"{args.Result[0].BarcodeFormat}:{args.Result[0].Text}";
        });
    }
}
