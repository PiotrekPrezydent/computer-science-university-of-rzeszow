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
    /// Logika interakcji dla klasy ReviewModification.xaml
    /// </summary>
    public partial class ReviewModification : Window
    {
        Review Context;
        public ReviewModification(Review context)
        {
            InitializeComponent();
            Context = context;
            ID.Text = context.Id.ToString();
            Rate.Text = context.Rate.ToString();
            ReviewContent.Text = context.Content;
            GameId.Text = context.GameId.ToString();
        }

        private void EditBTN_Click(object sender, RoutedEventArgs e)
        {
            try
            {
                Context.EditReview(float.Parse(Rate.Text), ReviewContent.Text, int.Parse(GameId.Text));
                Close();
            }
            catch (Exception ex)
            {
                MessageBox.Show("BLAD W USUWANIU: \n" + ex.ToString());
            }
        }

        private void DeleteBTN_Click(object sender, RoutedEventArgs e)
        {
            try
            {
                Context.RemoveReview();
                Close();
            }
            catch(Exception ex)
            {
                MessageBox.Show("BLAD W USUWANIU: \n" + ex.ToString());
            }
        }

        private void CloseBTN_Click(object sender, RoutedEventArgs e)
        {
            Close();
        }
    }
}
