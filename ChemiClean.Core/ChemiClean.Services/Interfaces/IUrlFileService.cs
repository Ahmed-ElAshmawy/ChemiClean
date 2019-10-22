namespace ChemiClean.Services.Interfaces
{
    public interface IUrlFileService
    {
        //Check if the url exists
        bool URLExists(string url);

        //Read all bytes of a given url
        byte[] ReadUrlFileData(string url);

        //Get file name form given path
        string GetFileName(string filePath);
    }
}
