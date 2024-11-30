using System;
namespace CheckInOutCGA.Model
{
    public class WeatherModel
    {
        public required string count { get; set; }
        public required Datum[] data { get; set; }
        public WeatherModel()
        {
            count = string.Empty;
            data = new Datum[0];//Array.Empty<Datum>(); // Inicializa el array vacío
        }

        public class Datum
        {
            public string city_name { get; set; }="";
            public string state_code { get; set; }
            public string country_code { get; set; }
            public string timezone { get; set; }
            public float lat { get; set; }
            public float lon { get; set; }
            public string station { get; set; }
            public float vis { get; set; }
            public float rh { get; set; }
            public float dewpt { get; set; }
            public float wind_dir { get; set; }
            public string wind_cdir { get; set; }
            public string wind_cdir_full { get; set; }
            public float wind_speed { get; set; }
            public float temp { get; set; }
            public float app_temp { get; set; }
            public float clouds { get; set; }
            public Weather weather { get; set; }
            public string datetime { get; set; }
            public string ob_time { get; set; }
            public float ts { get; set; }
            public string sunrise { get; set; }
            public string sunset { get; set; }
            public float slp { get; set; }
            public float pres { get; set; }
            public float aqi { get; set; }
            public float uv { get; set; }
            public float solar_rad { get; set; }
            public float ghi { get; set; }
            public float dni { get; set; }
            public float dhi { get; set; }
            public float elev_angle { get; set; }
            public float hour_angle { get; set; }
            public string pod { get; set; }
            public float precip { get; set; }
            public float snow { get; set; }


            public Datum()
            {
                city_name = "";
                state_code = "";
                country_code = "";
                timezone = "";
                lat = 0;
                lon = 0;
                station = "";
                vis = 0;
                rh = 0;
                dewpt = 0;
                wind_dir = 0;
                wind_cdir = "";
                wind_cdir_full = "";
                wind_speed = 0;
                temp = 0;
                app_temp = 0;
                clouds = 0;
                weather = new Weather();
                datetime = "";
                ob_time = "";
                ts = 0;
                sunrise = "";
                sunset = "";
                slp = 0;
                pres = 0;
                aqi = 0;
                uv = 0;
                solar_rad = 0;
                ghi = 0;
                dni = 0;
                dhi = 0;
                elev_angle = 0;
                hour_angle = 0;
                pod = "";
                precip = 0;
                snow = 0;

            }


        }
        public class Weather
        {
            public string icon { get; set; }
            public string code { get; set; }
            public string description { get; set; }
            public Weather()
            {
                icon = "";
                code = "";
                description = "";
            }
        }
    }
}

