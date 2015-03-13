namespace PrimeQueryWebApp;

interface

uses
  System,
  System.Data,
  System.Configuration,
  System.Collections,
  System.Web;

type
   Global_asax = public class(System.Web.HttpApplication)
   protected
     method Application_Start(sender: Object; e: EventArgs);
   end;

implementation

method Global_asax.Application_Start(sender: Object; e: EventArgs);
begin
  
end;

end.
    