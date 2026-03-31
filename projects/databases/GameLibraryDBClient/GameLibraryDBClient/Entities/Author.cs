using GameLibraryDBClient.Constants;

namespace GameLibraryDBClient.Entities
{
    public class Author
    {
        public int ID { get; set; }

        public string Name { get; set; }

        public string AverageRating => GetAverageRating();

        public Author(int id, string name)
        {
            ID = id;
            Name = name;
        }

        public static List<Author> GetAllAuthors()
        {
            List<Author> returned = new();
            var reader = DBManager.CallFunctionReturningCursor(Functions.GETALLAUTHORS);
            while (reader.Read())
            {
                Author a = new(reader.GetInt32(0), reader.GetString(1));
                returned.Add(a);
            }
            return returned;
        }

        public static void GetBestEarningAuthor(out string Name, out float earnings)
        {
            var reader = DBManager.CallFunctionReturningCursor(Functions.GETBESTEARNIGAUTHOR);
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

        public static void GetBestRatedAuthor(out string Name, out float ratings)
        {
            var reader = DBManager.CallFunctionReturningCursor(Functions.GETBESTRATEDAUTHOR);
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

        public static void AddAuthor(string name)
        {
            DBManager.CallProcedure(Procedures.ADDAUTHOR, name);
        }

        public void EditAuthor(string name)
        {
            DBManager.CallProcedure(Procedures.UPDATEAUTHOR, ID, name);
        }

        public void RemoveAuthor()
        {
            DBManager.CallProcedure(Procedures.REMOVEAUTHOR,ID);
        }

        public string GetAverageRating()
        {
            var reader = DBManager.CallFunctionReturningCursor(Functions.GETAVERAGERATINGBYAUTHOR, ID);
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
            var reader = DBManager.CallFunctionReturningCursor(Functions.GETGENRESWITHEARNINGSANDAVGRATINGSBYAUTHOR, ID);
            while (reader.Read())
            {
                Genre g = new(int.MinValue, reader.GetString(0));
                earnigs.Add(reader.GetFloat(1));
                ratings.Add(reader.GetFloat(2));
                returned.Add(g);
            }
            return returned;
        }

        public List<Game> GetAllGames()
        {
            List<Game> returned = new();
            var reader = DBManager.CallFunctionReturningCursor(Functions.GETGAMESBYAUTHOR, ID);
            while (reader.Read())
            {
                Game g = new(reader.GetInt32(0), reader.GetString(1), reader.GetDateTime(2), reader.GetFloat(3), ID, reader.GetInt32(4), reader.GetInt32(5));
                returned.Add(g);
            }
            return returned;

        }

        public void BestEarningGameName(out string name, out string earnings)
        {
            var reader = DBManager.CallFunctionReturningCursor(Functions.GETBESTEARNINGGAMEBYAUTHOR, ID);
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
            var reader = DBManager.CallFunctionReturningCursor(Functions.GETBESTRATEDGAMEFORAUTHOR, ID);
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
            var reader = DBManager.CallFunctionReturningCursor(Functions.GETBESTEARNINGGENREBYAUTHOR, ID);
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
            var reader = DBManager.CallFunctionReturningCursor(Functions.GETBESTRATEDGAMEFORAUTHOR, ID);
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
