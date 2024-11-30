using System;
namespace CheckInOutCGA.Model
{
	public class FlyoutPageItemModel
	{
        public string Title { get; set; }
        public string IconSource { get; set; }
        public Type TargetType { get; set; }

        public FlyoutPageItemModel(){
            Title="";
            IconSource="";
            TargetType=typeof(object);
        }
    }
}

