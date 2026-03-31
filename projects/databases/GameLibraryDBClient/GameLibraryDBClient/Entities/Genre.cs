using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using GameLibraryDBClient.Constants;

namespace GameLibraryDBClient.Entities
{
    public class Genre
    {
        public int Id;

        public string Name { get; set; }

        public string AverageRating => GetAverageRatings();

        public string Earnings => GetEarnings();

        public Genre(int id, string name)
        {
            Id = id;
            Name = name;
        }

        public static List<Genre> AllGenres()
        {
            var returned = new List<Genre>();
            var reader = DBManager.CallFunctionReturningCursor(Functions.GETALLGENRES);
            while (reader.Read())
            {
                Genre g = new(reader.GetInt32(0), reader.GetString(1));
                returned.Add(g);
            }
            return returned;
        }

        public static void GetBestRatedGenre(out string name, out string ratio)
        {
            var reader = DBManager.CallFunctionReturningCursor(Functions.GETBESTRATEDGENRE);
            name = "";
            ratio = "";
            if (reader.Read())
            {
                name = reader.GetString(0);
                ratio = reader.GetFloat(1).ToString();
            }

        }

        public static void GetBestEarningGenre(out string name, out string earnigs)
        {
            var reader = DBManager.CallFunctionReturningCursor(Functions.GETBESTEARNINGGENRE);
            name = "";
            earnigs = "";
            if (reader.Read())
            {
                name = reader.GetString(0);
                earnigs = reader.GetFloat(1).ToString();
            }
        }

        public static void AddGenre(string name)
        {
            DBManager.CallProcedure(Procedures.ADDGENRE, name);
        }

        public void EditGere(string name)
        {
            DBManager.CallProcedure(Procedures.UPDATEGENRE,Id, name);
        }

        public void RemoveGenre()
        {
            DBManager.CallProcedure(Procedures.REMOVEGENRE, Id);
        }

        public List<string> GetAllGames()
        {
            var list = new List<string>();
            var reader = DBManager.CallFunctionReturningCursor(Functions.GETGAMESBYGENRE,Id);
            while (reader.Read())
            {
                list.Add(reader.GetString(0));
            }
            return list;
        }

        public string GetAverageRatings()
        {
            var reader = DBManager.CallFunctionReturningCursor(Functions.GETAVERAGERATINGBYGENRE, Id);
            if (reader.Read())
            {
                if (reader.IsDBNull(0))
                    return "BRAK DANYCH";
                else
                    return reader.GetString(0);
            }
            else
                return "BLAD";
        }

        public string GetEarnings()
        {
            var reader = DBManager.CallFunctionReturningCursor(Functions.GETTOTALEARNINGSBYGENRE, Id);
            if (reader.Read())
            {
                if (reader.IsDBNull(0))
                    return "BRAK DANYCH";
                else
                    return reader.GetString(0);
            }
            else
                return "BLAD";
        }
    }
}
