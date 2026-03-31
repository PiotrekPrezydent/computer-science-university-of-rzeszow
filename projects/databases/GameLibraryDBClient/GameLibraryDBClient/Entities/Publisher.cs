using GameLibraryDBClient.Constants;

namespace GameLibraryDBClient.Entities
{
    public class Publisher
    {
        public int ID;

        public string Name { get; set; }

        public int MarginPrecent { get; set; }

        public string AverageRating => GetAverageRating();

        public Publisher(int id, string name, int marginPrecent)
        {
            ID = id;
            Name = name;
            MarginPrecent = marginPrecent;
        }

        public static List<Publisher> GetAllPublishers()
        {
            List<Publisher> returned = new();
            var reader = DBManager.CallFunctionReturningCursor(Functions.GETALLPUBLISHERS);
            while (reader.Read())
            {
                Publisher a = new(reader.GetInt32(0), reader.GetString(1),reader.GetInt32(2));
                returned.Add(a);
            }
            return returned;
        }

        public static void GetBestEarningPublisher(out string Name, out float earnings)
        {
            var reader = DBManager.CallFunctionReturningCursor(Functions.GETBESTEARNINGPUBLISHER);
            if (reader.Read())
            {
                Name = reader.GetString(0);
                earnings = reader.GetFloat(1);
            }
            else
            {
                Name = "BŁĄD";
                earnings = float.MinValue;
            }

        }

        public static void GetBestRatedPublisher(out string Name, out float ratings)
        {
            var reader = DBManager.CallFunctionReturningCursor(Functions.GETBESTRATEDPUBLISHER);
            if (reader.Read())
            {
                Name = reader.GetString(0);
                ratings = reader.GetFloat(1);
            }
            else
            {
                Name = "BŁĄD";
                ratings = float.MinValue;
            }
        }

        public static void AddPublisher(string name,int marginprecent)
        {
            DBManager.CallProcedure(Procedures.ADDPUBLISHER, name,marginprecent);
        }

        public void EditPublisher(string name, int marginprecent)
        {
            DBManager.CallProcedure(Procedures.UPDATEPUBLISHER, ID, name,marginprecent);
        }

        public void RemovePublisher()
        {
            DBManager.CallProcedure(Procedures.REMOVEPUBLISHER, ID);
        }

        public string GetAverageRating()
        {
            var reader = DBManager.CallFunctionReturningCursor(Functions.GETAVERAGERATINGBYPUBLISHER, ID);
            if (reader.Read())
            {
                if (!reader.IsDBNull(0))
                    return reader.GetFloat(0).ToString();
                else
                    return "BRAK DANYCH";
            }
            else
            {
                return "BŁĄD";
            }
        }

        public List<Genre> GetAllGenres(out List<float> ratings, out List<float> earnigs)
        {
            List<Genre> returned = new();
            ratings = new();
            earnigs = new();
            var reader = DBManager.CallFunctionReturningCursor(Functions.GETGENRESWITHRATINGSANDEARNINGSBYPUBLISHER, ID);
            while (reader.Read())
            {
                Genre g = new(reader.GetInt32(0), reader.GetString(1));
                ratings.Add(reader.GetFloat(2));
                earnigs.Add(reader.GetFloat(3));
                returned.Add(g);
            }
            return returned;
        }

        public List<Game> GetAllGames()
        {
            List<Game> returned = new();
            var reader = DBManager.CallFunctionReturningCursor(Functions.GETALLGAMESBYPUBLISHER, ID);
            while (reader.Read())
            {
                Game g = new(reader.GetInt32(0), reader.GetString(1), reader.GetDateTime(2), reader.GetFloat(3), reader.GetInt32(4), reader.GetInt32(5), reader.GetInt32(6));
                returned.Add(g);
            }
            return returned;
        }

        public void BestEarningGameName(out string name, out string earnings)
        {
            var reader = DBManager.CallFunctionReturningCursor(Functions.GETBESTSELLINGGAMEFORPUBLISHER, ID);
            if (reader.Read())
            {
                name = reader.GetString(0);
                earnings = reader.GetFloat(1).ToString();
            }
            else
            {
                name = "BRAK DANYCH";
                earnings = "BRAK DANYCH";
            }
        }

        public void BestRatedGameName(out string name, out string rate)
        {
            var reader = DBManager.CallFunctionReturningCursor(Functions.GETBESTRATEDGAMEFORPUBLISHER, ID);
            if (reader.Read())
            {
                name = reader.GetString(0);
                rate = reader.GetFloat(1).ToString();
            }
            else
            {
                name = "BRAK DANYCH";
                rate = "BRAK DANYCH";
            }
        }

        public void BestEarningGenre(out string name, out string earnings)
        {
            var reader = DBManager.CallFunctionReturningCursor(Functions.GETBESTSELLINGGENREFORPUBLISHER, ID);
            if (reader.Read())
            {
                name = reader.GetString(0);
                earnings = reader.GetFloat(1).ToString();
            }
            else
            {
                name = "BRAK DANYCH";
                earnings = "BRAK DANYCH";
            }
        }


        public void BestRatedGenre(out string name, out string rate)
        {
            var reader = DBManager.CallFunctionReturningCursor(Functions.GETBESTRATEDGENREFORPUBLISHER, ID);
            if (reader.Read())
            {
                name = reader.GetString(0);
                rate = reader.GetFloat(1).ToString();
            }
            else
            {
                name = "BRAK DANYCH";
                rate = "BRAK DANYCH";
            }
        }
    }
}
