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

namespace GameLibraryDBClient.MainMenu.Pages
{
    /// <summary>
    /// Logika interakcji dla klasy GamesGenrePage.xaml
    /// </summary>
    public partial class GamesGenrePage : Page
    {
        bool _show = false;
        public GamesGenrePage()
        {
            InitializeComponent();
            var gg = GameGenre.AllGameGenres();
            GameGenreListView.ItemsSource = gg;
        }

        void ListView_MouseDoubleClick(object sender, RoutedEventArgs e)
        {
            if (_show)
                return;
            _show = true;
            var gameGenre = ((ListView)sender).SelectedItem as GameGenre;
            GameGenreModification gameGenreModification = new(gameGenre);
            gameGenreModification.Show();
            gameGenreModification.Closing += new CancelEventHandler((o, s) =>
            {
                var gg = GameGenre.AllGameGenres();
                GameGenreListView.ItemsSource = gg;
                _show = false;
            });
        }

        private void AddGameGenre_Click(object sender, RoutedEventArgs e)
        {
            if (_show)
                return;
            _show = true;
            AddPopup.IsOpen = true;
        }

        void SubmitAddBTN_Click(object sender, RoutedEventArgs e)
        {
            try
            {
                GameGenre.AddGameGenre(int.Parse(GameID.Text), int.Parse(GenreID.Text));
                var gg = GameGenre.AllGameGenres();
                GameGenreListView.ItemsSource = gg;
                _show = false;
                AddPopup.IsOpen = false;
            }catch (Exception ex)
            {
                MessageBox.Show("BLAD PODCZAS DODWANIA: \n" + ex.Message);
            }

        }
        void CancelAddBTN_Click(object sender, RoutedEventArgs e)
        {
            _show = false;
            AddPopup.IsOpen = false;
        }
    }
}
