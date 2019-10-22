using ChemiClean.Services.Services;
using Xunit;

namespace ChemiClean.Web.Tests.Service
{
    public class UrlFileServiceTest
    {
        [Fact]
        public void NoneExistingURL()
        {
            UrlFileService urlFileService = new UrlFileService();

            string inValidUrl = "None";

            var nonExistingUrlResult = urlFileService.URLExists(inValidUrl);
            Assert.False(nonExistingUrlResult);
        }

    }
}
