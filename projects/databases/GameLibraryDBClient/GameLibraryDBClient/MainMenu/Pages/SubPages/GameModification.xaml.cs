using System;
using System.Collections.Generic;
using System.Linq;
using System.Printing;
using System.Text;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Imaging;
using System.Windows.Shapes;
using GameLibraryDBClient.Constants;
using GameLibraryDBClient.Entities;

namespace GameLibraryDBClient.MainMenu.Pages.SubPages
{
    /// <summary>
    /// Logika interakcji dla klasy GameModification.xaml
    /// </summary>
    public partial class GameModification : Window
    {
        Game context;
        public GameModification(Game game)
        {
            InitializeComponent();
            ID.Text = game._id.ToString();
            Name.Text = game.Title;
            ReleaseDate.Text = game.ReleaseDate.ToString();
            Price.Text = game.Price.ToString();
            AuthorID.Text = game._creatorId.ToString();
            PublisherID.Text = game._publisherId.ToString();
            SoldCopies.Text = game._soldCopies.ToString();
            context = game;
        }

        private void EditBTN_Click(object sender, RoutedEventArgs e)
        {
            try
            {
                DBManager.CallProcedure(Procedures.UPDATEGAME, ID.Text, Name.Text, ReleaseDate.Text, Price.Text, AuthorID.Text, PublisherID.Text, SoldCopies.Text);
                Close();
            }catch(Exception ex)
            {
                MessageBox.Show("BŁĄD W ZMIENIANIU DANYCH: " + ex.Message);
                return;
            }
        }

        private void ShowReviewsBTN_Click(object sender, RoutedEventArgs e)
        {
            var revs = context.GetAllReviews();
            string msg = "";
            foreach(var rev in revs)
                msg += "Ocena: \t" + rev.Rate + "\n" + "Tresc: \t" + rev.Content + "\n\n";

            MessageBox.Show(msg);
        }

        private void ShowGenresBTN_Click(object sender, RoutedEventArgs e)
        {
            var genres = context.GetAllGenres();
            string msg = "";
            foreach (var genre in genres)
                msg += "Nazwa: \t" + genre.Name + "\n";

            MessageBox.Show(msg);
        }

        private void ChangePriceBTN_Click(object sender, RoutedEventArgs e)
        {
            ChangePopup.IsOpen = true;
        }

        private void DeleteBTN_Click(object sender, RoutedEventArgs e)
        {
            try
            {
                context.Remove();
                Close();
            }catch(Exception ex)
            {
                MessageBox.Show("BŁĄD W USUWANIU: " + ex.Message);
                return;
            }
        }
        private void CancelBTN_Click(object sender, RoutedEventArgs e)
        {
            Close();
        }

        private void PopupYesBTN_Click(object sender, RoutedEventArgs e)
        {
            context.UpdatePriceBaseOnMonthlySale(int.Parse(MonthlySellsBox.Text));
            ChangePopup.IsOpen = false;
            Close();
        }

        private void PopupNoBTN_Click(object sender, RoutedEventArgs e)
        {
            ChangePopup.IsOpen = false;
        }


    }
}
