using System;
using System.ComponentModel;
using System.Runtime.CompilerServices;

namespace CheckInOutCGA.ViewModel
{
    public class BaseViewModel : INotifyPropertyChanged
    {
        public INavigation Navigation { get; set; } = default!;

        public event PropertyChangedEventHandler? PropertyChanged;
        public void OnpropertyChanged([CallerMemberName] string nombre = "")
        {
            PropertyChanged?.Invoke(this, new PropertyChangedEventArgs(nombre));
        }
        private ImageSource foto = ImageSource.FromFile("no_image.png");
        public ImageSource Foto
        {
            get { return foto; }
            set
            {
                foto = value;
                OnpropertyChanged();
            }
        }

        protected virtual void OnPropertyChanged([CallerMemberName] string propertyName = "")
        {
            PropertyChanged?.Invoke(this, new PropertyChangedEventArgs(propertyName));
        }

        public async Task DisplayAlert(string title, string message, string cancel)
        {
            if (Application.Current != null)
            {
                if (Application.Current.MainPage != null)
                {
                    await Application.Current.MainPage.DisplayAlert(title, message, cancel);
                }
            }
        }

        public async Task<bool> DisplayAlert(string title, string message, string accept, string cancel)
        {
            if (Application.Current != null)
            {
                if (Application.Current.MainPage != null)
                {
                    return await Application.Current.MainPage.DisplayAlert(title, message, accept, cancel);
                }
            }
            return false;
        }

        protected bool SetProperty<T>(ref T field, T value, [CallerMemberName] string propertyName = "")
        {
            if (EqualityComparer<T>.Default.Equals(field, value))
            {
                return false;
            }

            field = value;
            OnPropertyChanged(propertyName);

            return true;
        }

        private string _title = string.Empty;
        public string Title
        {
            get { return _title ?? ""; }
            set
            {
                SetProperty(ref _title, value);
            }
        }

        private bool _isBusy;
        public bool IsBusy
        {
            get { return _isBusy; }
            set
            {
                SetProperty(ref _isBusy, value);
            }
        }
        private bool _isEnable = true;
        public bool IsEnable
        {
            get { return _isEnable; }
            set
            {
                SetProperty(ref _isEnable, value);
            }
        }
        bool _isPassword;
        public bool IsPassword
        {
            get { return _isPassword; }
            set
            {
                SetProperty(ref _isPassword, value);
            }
        }
        protected void SetValue<T>(ref T backingFieled, T value, [CallerMemberName] string propertyName = "")
        {
            if (EqualityComparer<T>.Default.Equals(backingFieled, value))

            {

                return;

            }

            backingFieled = value;

            OnPropertyChanged(propertyName);
        }
    }
}

