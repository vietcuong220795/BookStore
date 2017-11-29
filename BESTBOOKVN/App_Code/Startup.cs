using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(DeTai.Startup))]
namespace DeTai
{
    public partial class Startup {
        public void Configuration(IAppBuilder app) {
            ConfigureAuth(app);
        }
    }
}
