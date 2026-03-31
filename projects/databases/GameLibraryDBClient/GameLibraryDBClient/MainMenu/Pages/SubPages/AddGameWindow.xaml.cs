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
    /// Logika interakcji dla klasy AddGameWindow.xaml
    /// </summary>
    public partial class AddGameWindow : Window
    {
        public AddGameWindow()
        {
            InitializeComponent();
        }

        private void CancelBTN_Click(object sender, RoutedEventArgs e)
        {
            this.Close();
        }

        private void AddBTN_Click(object sender, RoutedEventArgs e)
        {
            if (!ValidateData())
            {
                MessageBox.Show("PODANO ZŁE DANE");
                return;
            }
            MessageBox.Show("Dodano gre");
            Game.AddGame(Name.Text, DateTime.Parse(ReleaseDate.Text), float.Parse(Price.Text), int.Parse(AuthorID.Text), int.Parse(PublisherID.Text), int.Parse(SoldCopies.Text));
            this.Close();
        }

        bool ValidateData()
        {
            if (Name.Text == "")
                return false;

            if (!DateTime.TryParse(ReleaseDate.Text, out DateTime r1))
                return false;

            if (!float.TryParse(Price.Text, out float r2))
                return false;

            if (!int.TryParse(AuthorID.Text, out int r3))
                return false;

            if (!int.TryParse(PublisherID.Text, out int r4))
                return false;

            if (!int.TryParse(SoldCopies.Text, out int r))
                return false;

            return true;
        }
    }
}
