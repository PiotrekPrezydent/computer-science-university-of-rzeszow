using GameLibraryDBClient.Constants;


namespace GameLibraryDBClient.Entities
{
    public  class Game
    {
        public string Title { get => _title; }

        public string ReleaseDate { get => _releaseDate.Year + "/" + _releaseDate.Month + "/" + _releaseDate.Day; }

        public float Price { get => _price; }

        public string AuthorName { get => GetAuthorName(); }

        public string PublisherName { get => GetPublisherName(); }

        public int SoldCopies { get => _soldCopies; }

        public string TotalEarnings { get => GetTotalRevenue(); }

        public string AverageRatings { get => GetAverageRating(); }

        public int _id;

        public string _title;

        public DateTime _releaseDate;

        public float _price;

        public int _creatorId;

        public int _publisherId;

        public int _soldCopies;

        public Game(int id, string title, DateTime releaseDate, float price, int creator_Id, int publisher_Id, int soldCopies)
        {
            _id = id;
            _title = title;
            _releaseDate = releaseDate;
            _price = price;
            _creatorId = creator_Id;
            _publisherId = publisher_Id;
            _soldCopies = soldCopies;
        }
        //td add constructor from reader
        public static List<Game> GetAllGames()
        {
            List<Game> returned = new();
            var reader = DBManager.CallFunctionReturningCursor(Functions.GETALLGAMES);
            while (reader.Read())
            {
                Game g = new(
                    reader.GetInt32(0),
                    reader.GetString(1),
                    reader.GetDateTime(2),
                    reader.GetFloat(3),
                    reader.GetInt32(4),
                    reader.GetInt32(5),
                    reader.GetInt32(6)
                    );
                returned.Add(g);
            }
            return returned;

        }

        public static void GetBestRatedGame(out int id, out string name, out float rate)
        {
            var reader = DBManager.CallFunctionReturningCursor(Functions.GETBESTRATEDGAME);
            if (reader.Read())
            {
                id = reader.GetInt32(0);
                name = reader.GetString(1);
                rate = reader.GetFloat(2);
            }
            else
            {
                id = int.MinValue;
                name = "BLAD";
                rate = float.MinValue;
            }

        }

        public static void GetBestEarningGame(out int id, out string name, out float rate)
        {
            var reader = DBManager.CallFunctionReturningCursor(Functions.GETHIGHESTEARNINGGAME);
            if (reader.Read())
            {
                id = reader.GetInt32(0);
                name = reader.GetString(1);
                rate = reader.GetFloat(2);
            }
            else
            {
                id = int.MinValue;
                name = "BLAD";
                rate = float.MinValue;
            }
        }

        public static void AddGame(string name, DateTime releaseDate, float price, int authorId, int publisherId, int soldCopies)
        {
            DBManager.CallProcedure(Procedures.ADDGAME, name, releaseDate, price, authorId, publisherId, soldCopies);
        }

        public List<Review> GetAllReviews()
        {
            List<Review> ret = new();
            var reader = DBManager.CallFunctionReturningCursor(Functions.GETGAMEREVIEWS, _id);
            while (reader.Read())
            {
                ret.Add(new Review(reader.GetInt32(0), reader.GetFloat(1), reader.GetString(2), reader.GetInt32(3)));
            }
            return ret;
        }

        public List<Genre> GetAllGenres()
        {
            List<Genre> ret = new();
            var reader = DBManager.CallFunctionReturningCursor(Functions.GETGAMEGENRES, _id);
            while (reader.Read())
            {
                ret.Add(new Genre(reader.GetInt32(0), reader.GetString(1)));
            }
            return ret;
        }

        public string GetAverageRating()
        {
            var reader = DBManager.CallFunctionReturningCursor(Functions.GETAVERAGEGAMERATING, _id);
            try
            {
                return reader.Read() ? !reader.IsDBNull(0) ? reader.GetFloat(0).ToString() : "Brak Danych" : "Błąd";
            }
            catch
            {
                return "Błąd";
            }
        }

        public string GetTotalRevenue()
        {
            var reader = DBManager.CallFunctionReturningCursor(Functions.GETTOTALREVENUE, _id); 
            try
            {
                return reader.Read() ? !reader.IsDBNull(0) ? reader.GetFloat(0).ToString() : "Brak Danych" : "Błąd";
            }
            catch
            {
                return "Błąd";
            }
   
        }

        public string GetAuthorName()
        {
            var reader = DBManager.CallFunctionReturningCursor(Functions.GETGAMECREATORNAME,_id);
            try
            {
                return reader.Read() ? reader.GetString(0) : "BLAD";
            }
            catch
            {
                return "BLAD";
            }

        }

        public string GetPublisherName()
        {
            var reader = DBManager.CallFunctionReturningCursor(Functions.GETGAMEPUBLISHERNAME, _id);
            try
            {
                return reader.Read() ? reader.GetString(0) : "BLAD";
            }
            catch
            {
                return "BLAD";
            }
        }

        public void Remove()
        {
            DBManager.CallProcedure(Procedures.REMOVEGAME, _id);
        }

        public void UpdatePriceBaseOnMonthlySale(int monthlysales)
        {
            DBManager.CallProcedure(Procedures.UPDATEGAMEPRICEBASEDONMONTHLYSALES, _id,monthlysales);
        }

        public string GetEarningsForAuthor()
        {
            var reader = DBManager.CallFunctionReturningCursor(Functions.GETGAMESANDEARNINGSBYAUTHOR, _id);
            if (reader.Read())
            {
                return reader.GetFloat(0).ToString();
            }
            else
            {
                return "BŁĄD";
            }
        }

    }
}
