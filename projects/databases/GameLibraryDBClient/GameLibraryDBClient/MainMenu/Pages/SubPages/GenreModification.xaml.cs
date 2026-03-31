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
    /// Logika interakcji dla klasy GenreModification.xaml
    /// </summary>
    public partial class GenreModification : Window
    {
        Genre Context;
        public GenreModification(Genre context)
        {
            InitializeComponent();
            Context = context;
            ID.Text = context.Id.ToString();
            Name.Text = context.Name.ToString();

        }

        private void EditBTN_Click(object sender, RoutedEventArgs e)
        {
            try
            {
                Context.EditGere(Name.Text);
                Close();
            }catch(Exception ex)
            {
                MessageBox.Show("BLAD W EDYCJI: " + ex.Message);
            }
        }

        private void ShowGamesBTN_Click(object sender, RoutedEventArgs e)
        {
            string msg = "";
            foreach(var g in Context.GetAllGames())
            {
                msg += $"Nazwa: \t {g}\n";
            }
            MessageBox.Show(msg);
        }

        private void DeleteBTN_Click(object sender, RoutedEventArgs e)
        {
            try
            {
                Context.RemoveGenre();
                Close();
            }
            catch (Exception ex)
            {
                MessageBox.Show("BLAD W USUWANIU: " + ex.Message);
            }
        }

        private void CloseBTN_Click(object sender, RoutedEventArgs e)
        {
            Close();
        }
    }
}
