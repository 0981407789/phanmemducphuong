using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.Linq;
using System.Threading.Tasks;
using System.Web;
using Microsoft.AspNet.SignalR;

namespace WebApplication1
{
    public class ChatHub : Hub
    {
        public static bool atPrint = false;
        static string printconnectid = "";
        public static string printName = "";
        public void Hello()
        {
            Clients.All.hello();
        }
        public void SendPrintCommand(string message)
        {
            Clients.All.printClient(message);
        }
        public void ActivatePrint(string printname)
        {
            atPrint = true;
            Clients.All.printReady(printname);
            printName = printname;
            printconnectid = Context.ConnectionId;
        }
        public override Task OnConnected()
        {
            if (atPrint)
            {
                Clients.Caller.printReady(printName);
            }

            return base.OnConnected();
        }
        public override Task OnDisconnected(bool stopCalled)
        {
            string connnectionid = Context.ConnectionId;
            if (connnectionid == printconnectid)
            {
                atPrint = false;
                Clients.Caller.printReady("Printer Disconnected");
            }
            return base.OnDisconnected(stopCalled);
        }

    }
}