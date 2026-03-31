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
using GameLibraryDBClient.Constants;
using GameLibraryDBClient.Entities;
using GameLibraryDBClient.MainMenu.Pages.SubPages;
using Oracle.ManagedDataAccess.Client;
using Oracle.ManagedDataAccess.Types;

namespace GameLibraryDBClient.MainMenu.Pages
{
    public partial class AuthorsPage : Page
    {
        bool _subMenuOpened = false;
        public AuthorsPage()
        {
            InitializeComponent();
            var l = Author.GetAllAuthors();
            AuthorsListView.ItemsSource = l;
        }

        private void ListView_MouseDoubleClick(object sender, MouseButtonEventArgs e)
        {
            if (_subMenuOpened)
                return;
            _subMenuOpened = true;
            var author = ((ListView)sender).SelectedItem as Author;
            AuthorModification authorModification = new(author);
            authorModification.Show();
            authorModification.Closing += new CancelEventHandler((o, s) =>
            {
                var l = Author.GetAllAuthors();
                AuthorsListView.ItemsSource = l;
                _subMenuOpened = false;
            });
        }

        private void BestRatedAuthorBTN_Click(object sender, RoutedEventArgs e)
        {
            Author.GetBestRatedAuthor(out string name, out float ratings);
            string msg = $"Name: \t {name}\nRatings: \t {ratings}";
            MessageBox.Show(msg);
        }

        private void BestEarningAuthorBTN_Click(object sender, RoutedEventArgs e)
        {
            Author.GetBestEarningAuthor(out string name, out float earnigs);
            string msg = $"Name: \t {name}\nEarnings: \t {earnigs}";
            MessageBox.Show(msg);
        }

        private void AddAuthorBTN_Click(object sender, RoutedEventArgs e)
        {
            if (_subMenuOpened)
                return;
            _subMenuOpened = true;
            AddPopup.IsOpen = true;
        }

        private void AddPopupButton_Click(object sender, RoutedEventArgs e)
        {
            string name = AuthorName.Text;
            Author.AddAuthor(name);
            var l = Author.GetAllAuthors();
            AuthorsListView.ItemsSource = l;
            _subMenuOpened = false;
            AddPopup.IsOpen = false;
        }

        private void ClosePopupButton_Click(object sender, RoutedEventArgs e)
        {
            _subMenuOpened = false;
            AddPopup.IsOpen = false;
        }
    }
}
