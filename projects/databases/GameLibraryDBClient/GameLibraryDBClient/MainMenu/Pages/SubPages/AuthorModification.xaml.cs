using System;
using System.Collections.Generic;
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
using System.Windows.Shapes;
using GameLibraryDBClient.Entities;

namespace GameLibraryDBClient.MainMenu.Pages.SubPages
{
    /// <summary>
    /// Logika interakcji dla klasy AuthorModification.xaml
    /// </summary>
    public partial class AuthorModification : Window
    {
        public Author Context;
        public AuthorModification(Author context)
        {
            InitializeComponent();
            Context = context;
            ID.Text = Context.ID.ToString();
            Name.Text = Context.Name.ToString();

        }

        private void EditBTN_Click(object sender, RoutedEventArgs e)
        {
            Context.EditAuthor(Name.Text);
            Close();
        }

        private void ShowGamesBTN_Click(object sender, RoutedEventArgs e)
        {
            var l = Context.GetAllGames();
            string msg = "";

            foreach(var g in l)
                msg += $"Nazwa: \t {g.Title} \nŚredniaOcen: \t {g.AverageRatings} \nZarobek dla twórcy: \t {g.GetEarningsForAuthor()}\n\n";

            MessageBox.Show(msg);
        }

        private void ShowGenresBTN_Click(object sender, RoutedEventArgs e)
        {
            var l = Context.GetAllGenres(out List<float> ratings, out List<float> earnings);
            string msg = "";
            for(int i = 0; i < l.Count; i++)
            {
                msg += $"Nazwa: \t {l[i].Name} \nŚredniaOcen: \t {ratings[i]} \nZarobek dla twórcy: \t {earnings[i]}\n\n";
            }

            MessageBox.Show(msg);
        }

        private void ShowBestSellGamesBTN_Click(object sender, RoutedEventArgs e)
        {
            Context.BestEarningGameName(out string name, out string earnings);
            string msg = $"Nazwa: \t {name}\nZarobek: \t {earnings}";
            MessageBox.Show(msg);
        }

        private void ShowBestRatedGameBTN_Click(object sender, RoutedEventArgs e)
        {
            Context.BestRatedGameName(out string name, out string rate);
            string msg = $"Nazwa: \t {name}\nZarobek: \t {rate}";
            MessageBox.Show(msg);
        }

        private void ShowBestSellGenreBTN_Click(object sender, RoutedEventArgs e)
        {
            Context.BestEarningGenre(out string name, out string earnings);
            string msg = $"Nazwa: \t {name}\nZarobek: \t {earnings}";
            MessageBox.Show(msg);
        }

        private void ShowBestRatedGenreBTN_Click(object sender, RoutedEventArgs e)
        {
            Context.BestRatedGenre(out string name, out string rate);
            string msg = $"Nazwa: \t {name}\nZarobek: \t {rate}";
            MessageBox.Show(msg);
        }

        private void DeleteBTN_Click(object sender, RoutedEventArgs e)
        {
            Context.RemoveAuthor();
            Close();
        }

        private void CloseBTN_Click(object sender, RoutedEventArgs e)
        {
            Close();
        }
    }
}
