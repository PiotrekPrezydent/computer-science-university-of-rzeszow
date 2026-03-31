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
    /// Logika interakcji dla klasy Genres.xaml
    /// </summary>
    public partial class GenresPage : Page
    {
        bool _show = false;
        public GenresPage()
        {
            InitializeComponent();
            var l = Genre.AllGenres();
            GenresListView.ItemsSource = l;
        }
        private void ListView_MouseDoubleClick(object sender, RoutedEventArgs e)
        {
            if (_show)
                return;
            _show = true;
            var genre = ((ListView)sender).SelectedItem as Genre;
            GenreModification genreModification = new(genre);
            genreModification.Show();
            genreModification.Closing += new CancelEventHandler((o, s) =>
            {
                var l = Genre.AllGenres();
                GenresListView.ItemsSource = l;
                _show = false;
            });
        }

        private void AddGenreBTN_Click(object sender, RoutedEventArgs e)
        {
            if (_show)
                return;
            _show = true;
            AddPopup.IsOpen = true;
        }

        private void BestEarningGenreBTN_Click(object sender, RoutedEventArgs e)
        {
            Genre.GetBestEarningGenre(out string name, out string earnings);
            MessageBox.Show($"Nazwa: \t {name}\nZarobki: \t {earnings}");
        }

        private void BestRatedGenreBTN_Click(object sender, RoutedEventArgs e)
        {
            Genre.GetBestRatedGenre(out string name, out string ratio);
            MessageBox.Show($"Nazwa: \t {name}\nŚrednie oceny: \t {ratio}");
        }

        private void AddPopupButton_Click(object sender, RoutedEventArgs e)
        {
            try
            {
                Genre.AddGenre(GenreName.Text);
                var l = Genre.AllGenres();
                GenresListView.ItemsSource = l;
                AddPopup.IsOpen = false;
            }
            catch (Exception ex)
            {
                MessageBox.Show("BLAD W DODAWANIU: \n" + ex);
            }
        }

        void ClosePopupButton_Click(object sender, RoutedEventArgs e)
        {
            AddPopup.IsOpen = false;
        }
    }
}
