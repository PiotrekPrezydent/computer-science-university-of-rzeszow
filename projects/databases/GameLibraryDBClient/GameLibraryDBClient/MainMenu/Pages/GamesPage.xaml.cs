using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Imaging;
using System.Windows.Navigation;
using System.Windows.Shapes;
using GameLibraryDBClient.Entities;
using GameLibraryDBClient.MainMenu.Pages.SubPages;

namespace GameLibraryDBClient.MainMenu
{
    /// <summary>
    /// Logika interakcji dla klasy GamesPage.xaml
    /// </summary>
    public partial class GamesPage : Page
    {
        bool _subwindowoppened = false;
        public GamesPage()
        {
            InitializeComponent();
            var l = Game.GetAllGames();
            
            GamesListView.ItemsSource = l;
        }

        void BestRatedGameBTN_Click(object sender, RoutedEventArgs e)
        {
            Game.GetBestRatedGame(out int id, out string name, out float rate);
            IdText.Text = $"ID : {id}";
            NameText.Text = $"NAME : {name}";
            ScoreText.Text = $"RATINGS : {rate}";
            InfoPopup.IsOpen = true;  // Show the popup
        }

        void BestEarningGameBTN_Click(object sender, RoutedEventArgs e)
        {
            Game.GetBestEarningGame(out int id, out string name, out float rate);
            IdText.Text = $"ID : {id}";
            NameText.Text = $"NAME : {name}";
            ScoreText.Text = $"RATINGS : {rate}";
            InfoPopup.IsOpen = true;  // Show the popup
        }
        private void ListView_MouseDoubleClick(object sender, MouseButtonEventArgs e)
        {
            if (_subwindowoppened)
                return;
            _subwindowoppened = true;
            var game = ((ListView) sender).SelectedItem as Game;
            GameModification gameModification = new(game);
            gameModification.Show();
            gameModification.Closing += new CancelEventHandler((o, s) =>
            {
                var l = Game.GetAllGames();
                GamesListView.ItemsSource = l;
                _subwindowoppened = false;
            });
        }


        private void AddGameBTN_Click(object sender, RoutedEventArgs e)
        {
            if (_subwindowoppened)
                return;
            _subwindowoppened = true;
            AddGameWindow addGame = new();
            addGame.Show();
            addGame.Closing += new CancelEventHandler((o,s) =>
            {
                var l = Game.GetAllGames();
                GamesListView.ItemsSource = l;
                _subwindowoppened = false;
            });
        }

        // Event handler for the close button inside the popup
        private void ClosePopupButton_Click(object sender, RoutedEventArgs e)
        {
            InfoPopup.IsOpen = false;  // Close the popup
        }
    }
}
