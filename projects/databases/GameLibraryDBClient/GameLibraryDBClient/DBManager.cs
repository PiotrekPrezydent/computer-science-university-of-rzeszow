using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using GameLibraryDBClient.Constants;
using Oracle.ManagedDataAccess.Client;
using Oracle.ManagedDataAccess.Types;

namespace GameLibraryDBClient
{
    internal static class DBManager
    {
        public static string IP = "";
        public static string PORT = "";
        public static string SERVICE = "";
        public static string LOGIN = "";
        public static string PASSWORD = "";
        public static OracleConnection Client = null!;
        public static string cst = "";
        public static async void Connect(Action onSuccess, Action<Exception> onFail)
        {
            cst =$"User Id={LOGIN};Password={PASSWORD};Data Source={IP}:{PORT}/{SERVICE}";
            try
            {
                Client = new OracleConnection(cst);
                await Client.OpenAsync();
                onSuccess.Invoke();
                return;
            }catch(Exception ex)
            {
                onFail.Invoke(ex);
                return;
            }
        }
        public static void CallProcedure(string procedureName, params object[] parameters)
        {
            OracleCommand cmd = new OracleCommand(procedureName, Client);
            cmd.CommandType = CommandType.StoredProcedure;
            //add parameters if given
            for(int i = 0; i < parameters.Length; i++)
                cmd.Parameters.Add("", parameters[i]);

            cmd.ExecuteNonQuery();
        }

        public static OracleDataReader CallFunctionReturningCursor(string functionName, params object[] parameters)
        {
            OracleCommand cmd = new OracleCommand(functionName, Client);
            cmd.CommandType = CommandType.StoredProcedure;

            OracleParameter cursorParameter = new();
            cursorParameter.OracleDbType = OracleDbType.RefCursor;
            cursorParameter.Direction = ParameterDirection.ReturnValue;
            cmd.Parameters.Add(cursorParameter);
            //add parameters if given
            for (int i = 0; i < parameters.Length; i++)
                cmd.Parameters.Add("",parameters[i]);


            cmd.ExecuteNonQuery();

            OracleDataReader reader = ((OracleRefCursor)cursorParameter.Value).GetDataReader();
            return reader;
        }
    }
}
