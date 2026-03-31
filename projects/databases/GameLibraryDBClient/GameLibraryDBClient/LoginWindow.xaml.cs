using System.Data;
using System.Text;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Imaging;
using System.Windows.Navigation;
using System.Windows.Shapes;

namespace GameLibraryDBClient
{
    /// <summary>
    /// Interaction logic for MainWindow.xaml
    /// </summary>
    public partial class LoginWindow : Window
    {
        public static LoginWindow Instance = null!;
        bool _isClicked = false;
        public LoginWindow()
        {
            InitializeComponent();
            Instance = this;
        }

        private void ConnectBTN_Click(object sender, RoutedEventArgs e)
        {
            if (_isClicked)
                return;
            _isClicked = true;

            DBManager.IP = IP.Text;
            DBManager.PORT = Port.Text;
            DBManager.SERVICE = Service.Text;
            DBManager.LOGIN = Login.Text;
            DBManager.PASSWORD = Password.Text;
            var cancelToken = new CancellationTokenSource();

            ShowLoadingText();

#if DEBUG
            if(DBManager.IP == "DEBUG")
            {
                AppManager.StartMainMenuWindow();
                return;
            }
#endif
            DBManager.Connect(
                () => 
                {
                    cancelToken.Cancel();
                    ConnectionStatus.Text = "SUKCES";
                    AppManager.StartMainMenuWindow();
                    _isClicked = false;
                },
                ex =>
                {
                    cancelToken.Cancel();
                    ConnectionStatus.Text = "BLAD W POLACZENIU Z BAZA DANYCH:\n" + ex.Message;
                    _isClicked = false;
                }
            );
            
            async Task ShowLoadingText()
            {
                while (true)
                {
                    cancelToken.Token.ThrowIfCancellationRequested();
                    ConnectionStatus.Text = "TRWA ŁĄCZENIE";
                    for (int i = 0; i < 3; i++)
                    {
                        cancelToken.Token.ThrowIfCancellationRequested();
                        ConnectionStatus.Text += ".";
                        await Task.Delay(1000, cancelToken.Token);
                    }
                }
            }
        }
    }
}