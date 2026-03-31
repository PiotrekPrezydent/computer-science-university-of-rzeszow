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
    /// Logika interakcji dla klasy PublishersPage.xaml
    /// </summary>
    public partial class PublishersPage : Page
    {
        bool _subMenu = false;
        public PublishersPage()
        {
            InitializeComponent();
            var l = Publisher.GetAllPublishers();
            PublisherListView.ItemsSource = l;
        }

        private void ListView_MouseDoubleClick(object sender, MouseButtonEventArgs e)
        {
            if (_subMenu)
                return;
            _subMenu = true;
            var publisher = ((ListView)sender).SelectedItem as Publisher;
            PublisherModification publisherModification = new(publisher);
            publisherModification.Show();
            publisherModification.Closing += new CancelEventHandler((o, s) =>
            {
                var l = Author.GetAllAuthors();
                PublisherListView.ItemsSource = l;
                _subMenu = false;
            });
        }

        private void BestRatedPublisherBTN_Click(object sender, RoutedEventArgs e)
        {
            Publisher.GetBestRatedPublisher(out string name, out float ratings);
            string msg = $"Name: \t {name}\nRatings: \t {ratings}";
            MessageBox.Show(msg);
        }

        private void BestEarningPublisherBTN_Click(object sender, RoutedEventArgs e)
        {
            Publisher.GetBestEarningPublisher(out string name, out float earnigs);
            string msg = $"Name: \t {name}\nEarnings: \t {earnigs}";
            MessageBox.Show(msg);
        }

        private void AddPublisherBTN_Click(object sender, RoutedEventArgs e)
        {
            if (_subMenu)
                return;
            _subMenu = true;
            AddPopup.IsOpen = true;
        }


        private void AddPopupButton_Click(object sender, RoutedEventArgs e)
        {
            string name = PublisherName.Text;
            string margin = Margin.Text;
            try
            {
                Publisher.AddPublisher(name, int.Parse(margin));
                var l = Publisher.GetAllPublishers();
                PublisherListView.ItemsSource = l;
                _subMenu = false;
                AddPopup.IsOpen = false;
            }catch(Exception ex)
            {
                MessageBox.Show("BŁĄD W DODAWANIU: " + ex.ToString());
            }

        }

        private void ClosePopupButton_Click(object sender, RoutedEventArgs e)
        {
            _subMenu = false;
            AddPopup.IsOpen = false;
        }
    }
}
