using System.ComponentModel;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Input;
using GameLibraryDBClient.Entities;
using GameLibraryDBClient.MainMenu.Pages.SubPages;

namespace GameLibraryDBClient.MainMenu.Pages
{
    /// <summary>
    /// Logika interakcji dla klasy ReviewPage.xaml
    /// </summary>
    public partial class ReviewPage : Page
    {
        bool _open = false;
        public ReviewPage()
        {
            InitializeComponent();
            var r = Review.GetAllReviews();
            ReviewListView.ItemsSource = r;
        }

        private void ListView_MouseDoubleClick(object sender, MouseButtonEventArgs e)
        {
            if (_open)
                return;
            _open = true;
            var review = ((ListView)sender).SelectedItem as Review;
            ReviewModification reviewModification = new(review);
            reviewModification.Show();
            reviewModification.Closing += new CancelEventHandler((o, s) =>
            {
                var l = Review.GetAllReviews();
                ReviewListView.ItemsSource = l;
                _open = false;
            });
        }

        private void AddReviewBTN_Click(object sender, RoutedEventArgs e)
        {
            AddPopup.IsOpen = true;
        }

        private void SubmitAddBTN_Click(object sender, RoutedEventArgs e)
        {
            try
            {
                Review.AddReview(float.Parse(ReviewRate.Text), ReviewContent.Text, int.Parse(GameId.Text));
                var r = Review.GetAllReviews();
                ReviewListView.ItemsSource = r;
                AddPopup.IsOpen = false;
            }catch (Exception ex)
            {
                MessageBox.Show("BLAD W DODAWANIU: \n" + ex.ToString());
            }
        }

        private void CancelAddBTN_Click(object sender, RoutedEventArgs e)
        {
            AddPopup.IsOpen = false;
        }
    }
}
