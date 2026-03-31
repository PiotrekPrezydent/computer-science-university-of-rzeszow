using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using GameLibraryDBClient.Constants;

namespace GameLibraryDBClient.Entities
{
    public class Review
    {
        public int Id;

        public float Rate { get; set; }

        public string Content { get; set; }

        public string GameName => GetGameName();

        public int GameId;

        public Review(int id, float rate, string content, int gameId)
        {
            Id = id;
            Rate = rate;
            Content = content;
            GameId = gameId;
        }

        public static List<Review> GetAllReviews()
        {
            List<Review> ret = new();
            var reader = DBManager.CallFunctionReturningCursor(Functions.GETALLREVIEWS);
            while (reader.Read())
            {
                Review r = new(reader.GetInt32(0), reader.GetFloat(1), reader.GetString(2), reader.GetInt32(3));
                ret.Add(r);
            }
            return ret;
        }

        public static void AddReview(float rate, string content, int gameid)
        {
            DBManager.CallProcedure(Procedures.ADDREVIEW, rate, content, gameid);
        }

        public void EditReview(float rate, string content, int gameid)
        {
            DBManager.CallProcedure(Procedures.UPDATEREVIEW, Id, rate, content, gameid);
        }

        public void RemoveReview()
        {
            DBManager.CallProcedure(Procedures.REMOVEREVIEW, Id);
        }

        public string GetGameName()
        {
            var reader = DBManager.CallFunctionReturningCursor(Functions.GETGAMENAMEBYID, GameId);
            try
            {
                if (reader.Read())
                {
                    if (reader.IsDBNull(0))
                        return "BRAK DANYCH";
                    return reader.GetString(0);
                }
                else
                    return "BLAD";
            }catch(Exception ex)
            {
                return "BLAD";
            }

        }
    }
}
