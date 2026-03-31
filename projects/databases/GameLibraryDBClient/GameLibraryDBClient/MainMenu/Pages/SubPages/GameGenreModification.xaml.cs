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
    /// Logika interakcji dla klasy GameGenreModification.xaml
    /// </summary>
    public partial class GameGenreModification : Window
    {
        GameGenre Context;
        public GameGenreModification(GameGenre context)
        {
            InitializeComponent();
            Context = context;
            GameID.Text = context.GameID.ToString();
            GenreID.Text = context.GenreID.ToString();
        }

        private void EditBTN_Click(object sender, RoutedEventArgs e)
        {
            try
            {
                Context.EditGenreForGame(int.Parse(GenreID.Text));
                Close();
            }
            catch (Exception ex)
            {
                MessageBox.Show("BLAD PODCZAS Edytowania: \n" + ex.Message);
            }
        }

        private void DeleteBTN_Click(object sender, RoutedEventArgs e)
        {
            try
            {
                Context.RemoveGenreForGame();
                Close();
            }catch(Exception ex)
            {
                MessageBox.Show("BLAD PODCZAS USUWANIA: \n" + ex.Message);
            }
        }

        private void CloseBTN_Click(object sender, RoutedEventArgs e)
        {
            Close();
        }
    }
}
