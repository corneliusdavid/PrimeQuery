namespace PrimeQueryWPF;

interface

uses
  System.Collections.Generic,
  System.Linq,
  System.Windows,
  System.Windows.Controls,
  System.Windows.Data,
  System.Windows.Documents,
  System.Windows.Media,
  System.Windows.Navigation,
  System.Windows.Shapes;

type
  PrimeListPage = public partial class(System.Windows.Window)
  private
    SaveCountText: String;
    SaveElapsedText: String;
    method btnGenerate_Click(sender: System.Object; e: System.Windows.RoutedEventArgs);
  protected
    method ListPrimeFound(sender: System.Object; aEventArgs: EventArgs);
  public
    constructor;
  end;
  
implementation

uses
  PrimeQuery;

constructor PrimeListPage;
begin
  InitializeComponent();

  SaveCountText := txtTotalPrimes.Text;
  SaveElapsedText := txtElapsedTime.Text;
  grdPrimeList.Height := Height - btnGenerate.Height;
end;

method PrimeListPage.btnGenerate_Click(sender: System.Object; e: System.Windows.RoutedEventArgs);
var
  PrimeNumLst: PrimeNumberList;
  MinPrime, MaxPrime: UInt64;
begin
  PrimeNumLst := new PrimeNumberList;

  UInt64.TryParse(txtStartNum.Text, out MinPrime);
  UInt64.TryParse(txtEndNum.Text, out MaxPrime);

  System.Windows.Input.Mouse.OverrideCursor := System.Windows.Input.Cursors.Wait;
  try
    txtTotalPrimes.Visibility := Visibility.Visible;
    txtElapsedTime.Visibility := Visibility.Visible;
    lstPrimes.Visibility := Visibility.Visible;

    lstPrimes.Items.Clear;

    PrimeNumLst.MinNumber := MinPrime;
    PrimeNumLst.MaxNumber := MaxPrime;
    PrimeNumLst.OnFoundPrime += @ListPrimeFound;
    PrimeNumLst.Generate;

    txtTotalPrimes.Visibility := Visibility.Visible;
    txtTotalPrimes.Text := SaveCountText + PrimeNumLst.Count.ToString;
    txtElapsedTime.Visibility := Visibility.Visible;
    txtElapsedTime.Text := SaveElapsedText + PrimeNumLst.ElapsedSeconds.ToString;
  except
    on Exception do
      MessageBox.Show('Error: ' + e.ToString);
  finally
    System.Windows.Input.Mouse.OverrideCursor := nil;
  end;
end;

method PrimeListPage.ListPrimeFound(sender: Object; aEventArgs: EventArgs);
var
  NewListItem: ListBoxItem;
begin
  NewListItem := new ListBoxItem;

  if (sender as PrimeNumberList).Count mod 2 = 0 then
    NewListItem.Background := Brushes.WhiteSmoke
  else 
    NewListItem.Background := Brushes.Bisque;

  NewListItem.Content := (sender as PrimeNumberList).Number;
  lstPrimes.Items.Add(NewListItem);
end;

end.
