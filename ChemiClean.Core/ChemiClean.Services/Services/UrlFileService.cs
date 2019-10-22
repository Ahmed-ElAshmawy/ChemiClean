using ChemiClean.Services.Interfaces;
using System;
using System.Net;

namespace ChemiClean.Services.Services
{
    public class UrlFileService : IUrlFileService
    {
        public string GetFileName(string filePath)
        {
            Uri uri = new Uri(filePath);
            string fileName = System.IO.Path.GetFileName(uri.LocalPath);
            return fileName;
        }

        public byte[] ReadUrlFileData(string url)
        {
            byte[] urlFileData = new WebClient().DownloadData(url);
            return urlFileData;
        }

        public bool URLExists(string url)
        {
            WebRequest webRequest = WebRequest.Create(url);
            webRequest.Method = "HEAD";

            try
            {
                using (HttpWebResponse response = (HttpWebResponse)webRequest.GetResponse())
                {
                    if (response.StatusCode == HttpStatusCode.OK)
                    {
                        return true;
                    }

                    return false;
                }
            }
            catch
            {
                return false;
            }
        }
    }
}
