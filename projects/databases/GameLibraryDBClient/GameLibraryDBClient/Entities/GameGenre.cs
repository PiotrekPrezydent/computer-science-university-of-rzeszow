using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows;
using GameLibraryDBClient.Constants;
using Oracle.ManagedDataAccess.Client;

namespace GameLibraryDBClient.Entities
{
    public class GameGenre
    {
        public string GameName => GetGameName();

        public string GenreName => GetGenreName();

        public int GameID;

        public int GenreID;

        public GameGenre(int gameID, int genreID)
        {
            GameID = gameID;
            GenreID = genreID;
        }

        public static List<GameGenre> AllGameGenres()
        {
            List<GameGenre> ret = new();
            var reader = DBManager.CallFunctionReturningCursor(Functions.GETALLGAMEGENRESNAMES);
            while (reader.Read())
            {
                GameGenre gg = new(reader.GetInt32(0), reader.GetInt32(1));
                ret.Add(gg);
            }
            return ret;
        }

        public static void AddGameGenre(int gameId, int genreId)
        {
            DBManager.CallProcedure(Procedures.ADDGAMEGENRE, gameId, genreId);
        }
        public void EditGenreForGame(int newGenreId)
        {
            DBManager.CallProcedure(Procedures.UPDATEGAMEGENREBYGAMEID, GameID, GenreID, newGenreId);
        }

        public void RemoveGenreForGame()
        {
            DBManager.CallProcedure(Procedures.REMOVEGAMEGENRE, GameID, GenreID);
        }

        public string GetGameName()
        {
            var reader = DBManager.CallFunctionReturningCursor(Functions.GETGAMENAMEBYID, GameID);
            try
            {
                reader.Read();
                return reader.GetString(0);
            }
            catch (Exception ex)
            {
                return "BRAK DANYCH";
            }
        }

        public string GetGenreName()
        {
            var reader = DBManager.CallFunctionReturningCursor(Functions.GETGENRENAMEBYID, GenreID);
            try
            {
                reader.Read();
                return reader.GetString(0);
            }
            catch (Exception ex)
            {
                return "BRAK DANYCH";
            }
        }


    }
}
