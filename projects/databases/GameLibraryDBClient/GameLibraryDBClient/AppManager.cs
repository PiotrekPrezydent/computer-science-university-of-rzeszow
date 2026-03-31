using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace GameLibraryDBClient
{
    internal static class AppManager
    {
        public static void StartMainMenuWindow()
        {
            MainMenuWindow mainMenuWindow = new MainMenuWindow();
            mainMenuWindow.Show();
            LoginWindow.Instance.Close();
        }
    }
}
