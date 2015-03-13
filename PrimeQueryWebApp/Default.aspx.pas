namespace PrimeQueryWebApp;

interface

uses
  System.Linq,
  System.Web,
  System.Web.UI;

type
  _Default = public partial class(System.Web.UI.Page)
  public
    method btnCheck_Click(sender: Object; e: EventArgs);
  end;


implementation

uses 
  PrimeQuery;

method _Default.btnCheck_Click(sender: Object; e: EventArgs);
var
  TestNum: UInt64;
begin
  UInt64.TryParse(txtPrimeEntry.Text, out TestNum);

  if PrimeNumberQuery.IsPrime(TestNum) then begin 
    lblIsPrime.CssClass := 'isprimelabel';
    lblIsPrime.Text := TestNum.ToString + ' is a Prime!';
  end else begin
    lblIsPrime.CssClass := 'notprimelabel';
    lblIsPrime.Text := TestNum.ToString + ' is not a prime';
  end;
end;

end.
