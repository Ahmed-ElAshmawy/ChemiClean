using ChemiClean.Core.Models;

namespace ChemiClean.Services.Interfaces
{
    public interface IProductDocumentService
    {
        //Get product document
        tblProductDocument GetProductDocument(int id);

        //Add product document
        void CreateProductDocument(tblProductDocument productDocument);

        //Update product document
        void UpdateProductDocument(tblProductDocument productDocument);

        //Remove product document
        void DeleteProductDocument(tblProductDocument productDocument);

        //Logic for adding new document to a product
        bool ProcessProductAddedDocument(tblProduct product);

        //Logic for updating a document of a product
        bool ProcessProductUpdatedDocument(tblProduct product);

        //Save changes
        void SaveProductDocument();
    }
}
