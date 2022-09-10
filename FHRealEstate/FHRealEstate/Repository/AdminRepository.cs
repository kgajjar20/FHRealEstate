using FHRealEstate.DB;
using FHRealEstate.Helper;
using FHRealEstate.Models;
using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using static FHRealEstate.Enumerations;

namespace FHRealEstate.Repository
{
    public interface IAdmin
    {
        Task<List<TextValueGuid>> GetAllAminities();
        Task<List<PropertyModel>> GetProperties();
        Task<PropertiesResponseModel> GetPropertiesDetails(PropertiesRequestModel request);
        Task<List<PropertyModel>> GetRentPropertiesForDashboardAsync();
        Task<List<PropertyModel>> GetSellPropertiesForDashboardAsync();
        Task<List<TextValueInt>> GetPropertyTypeList();
        Task<List<TextValueInt>> GetPropertyStatusList();
        Task<List<TextValueInt>> GetConstructionStatusList();
        Task<bool> AddUpdateProperty(AddUpdatePropertyModel model, List<FileModel> files);
        Task<PropertyModel> GetPropertyAsync(Guid propertyId);
        Task<bool> DeleteProperty(Guid Id);
    }

    public class AdminRepository : IAdmin
    {
        public FHRealEstateContext _context;
        private AuthenticationHelper _authenticationHelper;
        public AdminRepository(FHRealEstateContext context, AuthenticationHelper authenticationHelper)
        {
            _context = context;
            _authenticationHelper = authenticationHelper;
        }

        #region Get All Aminities
        public async Task<List<TextValueGuid>> GetAllAminities()
        {
            var aminities = await (from x in _context.Amenities
                                   where
                                     x.Status == (int)Status.Active
                                   select new TextValueGuid()
                                   {
                                       Text = x.AmenityName,
                                       Value = x.AmenityId
                                   }).ToListAsync();
            return aminities;
        }

        #endregion

        #region Get Property Type List
        public async Task<List<TextValueInt>> GetPropertyTypeList()
        {
            var ptList = await (from x in _context.PropertyType
                                where
                                  x.Status == (int)Status.Active
                                select new TextValueInt()
                                {
                                    Text = x.PropertyTypeName,
                                    Value = x.PropertyTypeId
                                }).ToListAsync();
            return ptList;
        }

        #endregion

        #region Get Property Status List
        public async Task<List<TextValueInt>> GetPropertyStatusList()
        {
            var ptList = await (from x in _context.PropertyStatus
                                where
                                  x.Status == (int)Status.Active
                                select new TextValueInt()
                                {
                                    Text = x.PropertyStatusName,
                                    Value = x.PropertyStatusId
                                }).ToListAsync();
            return ptList;
        }

        #endregion

        #region Get Construction Status List
        public async Task<List<TextValueInt>> GetConstructionStatusList()
        {
            var list = await (from x in _context.ConstructionStatus
                              where
                              x.Status == (int)Status.Active
                              select new TextValueInt()
                              {
                                  Text = x.ConstructionStatusName,
                                  Value = x.ConstructionStatusId
                              }).ToListAsync();
            return list;
        }

        #endregion

        #region Add/Update Property
        public async Task<bool> AddUpdateProperty(AddUpdatePropertyModel model, List<FileModel> files)
        {

            bool result = false;
            bool isAddProperty = false;
            var property = await _context.Property.Where(x => model.PropertyId != null && model.PropertyId != Guid.Empty && x.PropertyId == model.PropertyId && x.Status != (int)Status.Deleted).FirstOrDefaultAsync();

            if (property == null)
            {
                isAddProperty = true;
                property = new Property();
                property.PropertyId = Guid.NewGuid();
            }
            property.Title = model.Title;
            property.Description = model.Description;
            property.PropertyTypeId = model.PropertyTypeId;
            property.PropertyStatusId = model.PropertyStatusId;
            property.ConstructionStatusId = model.ConstructionStatusId;
            property.MinPrice = model.MinPrice;
            property.MaxPrice = model.MaxPrice;
            property.PropertySize = model.PropertySize;
            property.PropertySizePrefix = model.PropertySizePrefix;
            property.GarageSize = model.GarageSize;
            property.GarageSizePrefix = model.GarageSizePrefix;
            property.TotalRooms = model.TotalRooms;
            property.TotalGarages = model.TotalGarages;
            property.TotalBathrooms = model.TotalBathrooms;
            property.BuildYear = model.BuildYear;
            property.Address = model.Address;
            property.City = model.City;
            property.State = model.State;
            property.Zip = model.Zip;
            property.Country = model.Country;
            property.VideoUrl = model.VideoUrl;
            property.VirtualTourUrl = model.VirtualTourUrl;
            property.Status = (int)Status.Active;
            if (isAddProperty)
            {
                _context.Property.Add(property);
            }

            #region Add Amenities
            var aminities = await _context.PropertyAmenity.Where(x => x.PropertyId == property.PropertyId).ToListAsync();
            if (aminities != null && aminities.Count > 0)
            {
                _context.PropertyAmenity.RemoveRange(aminities);
            }
            if (model.CheckedAminities != null && model.CheckedAminities.Count() > 0)
            {
                model.CheckedAminities.ToList().ForEach(x =>
                {
                    _context.PropertyAmenity.Add(new PropertyAmenity() { AmenityId = x, PropertyId = property.PropertyId });
                });
            }
            #endregion

            #region Add Property Images
            if (files != null && files.Count > 0)
            {
                files.ForEach(x =>
                {
                    #region Add Property Images
                    if (x.FileType == (int)PropertyImageType.GalleryImage)
                    {

                        _context.PropertyImage.Add(new PropertyImage()
                        {
                            ImageName = x.NewFileName,
                            ImageType = (int)PropertyImageType.GalleryImage,
                            PropertyId = property.PropertyId,
                            PropertyImageId = Guid.NewGuid(),
                            CreatedDate = DateTime.Now,
                            CreatedBy = UserSession.UserId
                        });
                    }
                    #endregion

                    #region Add Property Documents

                    if (x.FileType == (int)PropertyImageType.Documents)
                    {
                        _context.PropertyImage.Add(new PropertyImage()
                        {
                            ImageName = x.NewFileName,
                            ImageType = (int)PropertyImageType.Documents,
                            PropertyId = property.PropertyId,
                            PropertyImageId = Guid.NewGuid(),
                            CreatedDate = DateTime.Now,
                            CreatedBy = UserSession.UserId
                        });
                    }

                    #endregion
                });
            }

            #endregion

            await _context.SaveChangesAsync();
            result = true;
            return result;
        }
        #endregion

        #region Get Property
        public async Task<PropertyModel> GetPropertyAsync(Guid propertyId)
        {
            PropertyModel model = new PropertyModel();

            var x = await _context.Property.Where(x => x.PropertyId == propertyId && x.Status != (int)Status.Deleted).FirstOrDefaultAsync();
            if (x != null)
            {
                model = new PropertyModel()
                {
                    Address = x.Address,
                    BuildYear = x.BuildYear,
                    City = x.City,
                    ConstructionStatusId = x.ConstructionStatusId,
                    ConstructionStatus = (from xx in _context.ConstructionStatus where xx.ConstructionStatusId == x.ConstructionStatusId select xx.ConstructionStatusName).FirstOrDefault(),
                    Country = x.Country,
                    Description = x.Description,
                    GarageSize = x.GarageSize,
                    GarageSizePrefix = x.GarageSizePrefix,
                    MaxPrice = x.MaxPrice,
                    MinPrice = x.MinPrice,
                    PropertyId = x.PropertyId,
                    PropertySize = x.PropertySize,
                    PropertySizePrefix = x.PropertySizePrefix,
                    PropertyStatusId = x.PropertyStatusId,
                    PropertyStatusText = (from xx in _context.PropertyStatus where xx.PropertyStatusId == x.PropertyStatusId select xx.PropertyStatusName).FirstOrDefault(),
                    PropertyTypeId = x.PropertyTypeId,
                    PropertyTypeText = (from xx in _context.PropertyType where xx.PropertyTypeId == x.PropertyTypeId select xx.PropertyTypeName).FirstOrDefault(),
                    State = x.State,
                    Status = x.Status,
                    Title = x.Title,
                    TotalBathrooms = x.TotalBathrooms,
                    TotalGarages = Convert.ToInt32(x.TotalGarages),
                    TotalRooms = x.TotalRooms,
                    VideoUrl = x.VideoUrl,
                    VirtualTourUrl = x.VirtualTourUrl,
                    Zip = x.Zip,
                    Aminities = (from xx in _context.PropertyAmenity
                                 join yy in _context.Amenities on xx.AmenityId equals yy.AmenityId
                                 where xx.PropertyId == x.PropertyId
                                 && yy.Status == (int)Status.Active
                                 orderby yy.AmenityName
                                 select yy.AmenityName
                                 ).ToList(),
                    PropertyImages = (from xx in _context.PropertyImage where xx.PropertyId == x.PropertyId && xx.ImageType == (int)PropertyImageType.GalleryImage orderby xx.ImageName select xx.ImageName).ToList(),
                    PropertyDocuments = (from xx in _context.PropertyImage where xx.PropertyId == x.PropertyId && xx.ImageType == (int)PropertyImageType.Documents orderby xx.ImageName select xx.ImageName).ToList()

                };
            }
            return model;
        }
        #endregion

        public async Task<List<PropertyModel>> GetProperties()
        {
            var constructionStatusList = (from xx in _context.ConstructionStatus select xx).AsQueryable();
            var propertyStatusList = (from xx in _context.PropertyStatus select xx).AsQueryable();
            var propertyTypeList = (from xx in _context.PropertyType select xx).AsQueryable();
            var aminitiesList = (from xx in _context.PropertyAmenity
                                 join yy in _context.Amenities on xx.AmenityId equals yy.AmenityId
                                 where yy.Status == (int)Status.Active
                                 orderby yy.AmenityName
                                 select new
                                 {
                                     PropertyId = xx.PropertyId,
                                     AmenityName = yy.AmenityName
                                 }).AsQueryable();
            var propertyImagesList = (from xx in _context.PropertyImage where xx.ImageType == (int)PropertyImageType.GalleryImage select xx).AsQueryable();
            var documentsList = (from xx in _context.PropertyImage where xx.ImageType == (int)PropertyImageType.Documents select xx).AsQueryable();

            try
            {
                var properties = (from x in _context.Property
                                  where x.Status != (int)Status.Deleted
                                  select new PropertyModel()
                                  {
                                      Address = x.Address,
                                      BuildYear = x.BuildYear,
                                      City = x.City,
                                      ConstructionStatusId = x.ConstructionStatusId,
                                      ConstructionStatus = constructionStatusList.Where(s => s.ConstructionStatusId == x.ConstructionStatusId).Select(s => s.ConstructionStatusName).FirstOrDefault(),
                                      Country = x.Country,
                                      Description = x.Description,
                                      GarageSize = x.GarageSize,
                                      GarageSizePrefix = x.GarageSizePrefix,
                                      MaxPrice = x.MaxPrice,
                                      MinPrice = x.MinPrice,
                                      PropertyId = x.PropertyId,
                                      PropertySize = x.PropertySize,
                                      PropertySizePrefix = x.PropertySizePrefix,
                                      PropertyStatusId = x.PropertyStatusId,
                                      PropertyStatusText = propertyStatusList.Where(s => s.PropertyStatusId == x.PropertyStatusId).Select(s => s.PropertyStatusName).FirstOrDefault(),
                                      PropertyTypeId = x.PropertyTypeId,
                                      PropertyTypeText = propertyTypeList.Where(s => s.PropertyTypeId == x.PropertyTypeId).Select(s => s.PropertyTypeName).FirstOrDefault(),
                                      State = x.State,
                                      Status = x.Status,
                                      Title = x.Title,
                                      TotalBathrooms = x.TotalBathrooms,
                                      TotalGarages = Convert.ToInt32(x.TotalGarages),
                                      TotalRooms = x.TotalRooms,
                                      VideoUrl = x.VideoUrl,
                                      VirtualTourUrl = x.VirtualTourUrl,
                                      Zip = x.Zip,
                                      Aminities = aminitiesList.Where(s => s.PropertyId == x.PropertyId).OrderBy(s => s.AmenityName).Select(s => s.AmenityName).ToList(),
                                      PropertyImages = propertyImagesList.Where(s => s.PropertyId == x.PropertyId).OrderBy(s => s.ImageName).Select(s => s.ImageName).ToList(),
                                      PropertyDocuments = documentsList.Where(s => s.PropertyId == x.PropertyId).OrderBy(s => s.ImageName).Select(s => s.ImageName).ToList(),
                                  }).AsQueryable();


                var r = await properties.ToListAsync();
                return r;
            }
            catch (Exception ex)
            {
                var ra = new List<PropertyModel>() { };
                return ra;
            }
        }

        public async Task<PropertiesResponseModel> GetPropertiesDetails(PropertiesRequestModel model)
        {
            PropertiesResponseModel response = new PropertiesResponseModel();
            response.Request = model.Request;

            var constructionStatusList = (from xx in _context.ConstructionStatus select xx).AsQueryable();
            var propertyStatusList = (from xx in _context.PropertyStatus select xx).AsQueryable();
            var propertyTypeList = (from xx in _context.PropertyType select xx).AsQueryable();
            var aminitiesList = (from xx in _context.PropertyAmenity
                                 join yy in _context.Amenities on xx.AmenityId equals yy.AmenityId
                                 where yy.Status == (int)Status.Active
                                 orderby yy.AmenityName
                                 select new
                                 {
                                     PropertyId = xx.PropertyId,
                                     AmenityName = yy.AmenityName
                                 }).AsQueryable();
            var propertyImagesList = (from xx in _context.PropertyImage where xx.ImageType == (int)PropertyImageType.GalleryImage select xx).AsQueryable();
            var documentsList = (from xx in _context.PropertyImage where xx.ImageType == (int)PropertyImageType.Documents select xx).AsQueryable();


            if (model.Request == null)
            {
                model.Request = new DataRequest();
            }

            model.Request.PageSize = model.Request.PageSize == 0 ? 50 : model.Request.PageSize;
            model.Request.PageIndex = model.Request.PageIndex == 0 ? 1 : model.Request.PageIndex;

            try
            {
                var properties = (from x in _context.Property
                                  where x.Status != (int)Status.Deleted
                                  && model.PropertyStatusId == null || model.PropertyStatusId == x.PropertyStatusId
                                  orderby x.CreatedDate descending
                                  select new PropertyModel()
                                  {
                                      Address = x.Address,
                                      BuildYear = x.BuildYear,
                                      City = x.City,
                                      ConstructionStatusId = x.ConstructionStatusId,
                                      ConstructionStatus = constructionStatusList.Where(s => s.ConstructionStatusId == x.ConstructionStatusId).Select(s => s.ConstructionStatusName).FirstOrDefault(),
                                      Country = x.Country,
                                      Description = x.Description,
                                      GarageSize = x.GarageSize,
                                      GarageSizePrefix = x.GarageSizePrefix,
                                      MaxPrice = x.MaxPrice,
                                      MinPrice = x.MinPrice,
                                      PropertyId = x.PropertyId,
                                      PropertySize = x.PropertySize,
                                      PropertySizePrefix = x.PropertySizePrefix,
                                      PropertyStatusId = x.PropertyStatusId,
                                      PropertyStatusText = propertyStatusList.Where(s => s.PropertyStatusId == x.PropertyStatusId).Select(s => s.PropertyStatusName).FirstOrDefault(),
                                      PropertyTypeId = x.PropertyTypeId,
                                      PropertyTypeText = propertyTypeList.Where(s => s.PropertyTypeId == x.PropertyTypeId).Select(s => s.PropertyTypeName).FirstOrDefault(),
                                      State = x.State,
                                      Status = x.Status,
                                      Title = x.Title,
                                      TotalBathrooms = x.TotalBathrooms,
                                      TotalGarages = Convert.ToInt32(x.TotalGarages),
                                      TotalRooms = x.TotalRooms,
                                      VideoUrl = x.VideoUrl,
                                      VirtualTourUrl = x.VirtualTourUrl,
                                      Zip = x.Zip,
                                      Aminities = aminitiesList.Where(s => s.PropertyId == x.PropertyId).OrderBy(s => s.AmenityName).Select(s => s.AmenityName).ToList(),
                                      PropertyImages = propertyImagesList.Where(s => s.PropertyId == x.PropertyId).OrderBy(s => s.ImageName).Select(s => s.ImageName).ToList(),
                                      PropertyDocuments = documentsList.Where(s => s.PropertyId == x.PropertyId).OrderBy(s => s.ImageName).Select(s => s.ImageName).ToList(),
                                  }).AsQueryable();


                response.Total = properties.Count();

                if (!string.IsNullOrWhiteSpace(model.Request.Sort))
                {
                    if (model.Request.Sort == "MinPrice")
                    {
                        properties = properties.OrderBy(s => s.MinPrice);
                    }
                    if (model.Request.Sort == "MaxPrice")
                    {
                        properties = properties.OrderByDescending(s => s.MaxPrice);
                    }
                    if (model.Request.Sort == "BuildYear")
                    {
                        properties = properties.OrderByDescending(s => s.BuildYear);
                    }
                }

                var pagedproperties = properties.Skip((model.Request.PageIndex - 1) * model.Request.PageSize).Take(model.Request.PageSize);
                var pagedpropertiesList = await pagedproperties.ToListAsync();

                response.AllProperties = pagedpropertiesList;
                return response;
            }
            catch (Exception ex)
            {
                return response;
            }
        }


        public async Task<List<PropertyModel>> GetRentPropertiesForDashboardAsync()
        {
            List<PropertyModel> properties = await (from x in _context.Property
                                                    where x.Status != (int)Status.Deleted
                                                    && x.PropertyStatusId == (int)Enumerations.PropertyStatus.For_Rent
                                                    orderby x.CreatedDate descending
                                                    select new PropertyModel()
                                                    {
                                                        Address = x.Address,
                                                        BuildYear = x.BuildYear,
                                                        City = x.City,
                                                        ConstructionStatusId = x.ConstructionStatusId,
                                                        ConstructionStatus = (from xx in _context.ConstructionStatus where xx.ConstructionStatusId == x.ConstructionStatusId select xx.ConstructionStatusName).FirstOrDefault(),
                                                        Country = x.Country,
                                                        Description = x.Description,
                                                        GarageSize = x.GarageSize,
                                                        GarageSizePrefix = x.GarageSizePrefix,
                                                        MaxPrice = x.MaxPrice,
                                                        MinPrice = x.MinPrice,
                                                        PropertyId = x.PropertyId,
                                                        PropertySize = x.PropertySize,
                                                        PropertySizePrefix = x.PropertySizePrefix,
                                                        PropertyStatusId = x.PropertyStatusId,
                                                        PropertyStatusText = (from xx in _context.PropertyStatus where xx.PropertyStatusId == x.PropertyStatusId select xx.PropertyStatusName).FirstOrDefault(),
                                                        PropertyTypeId = x.PropertyTypeId,
                                                        PropertyTypeText = (from xx in _context.PropertyType where xx.PropertyTypeId == x.PropertyTypeId select xx.PropertyTypeName).FirstOrDefault(),
                                                        State = x.State,
                                                        Status = x.Status,
                                                        Title = x.Title,
                                                        TotalBathrooms = x.TotalBathrooms,
                                                        TotalGarages = Convert.ToInt32(x.TotalGarages),
                                                        TotalRooms = x.TotalRooms,
                                                        VideoUrl = x.VideoUrl,
                                                        VirtualTourUrl = x.VirtualTourUrl,
                                                        Zip = x.Zip,
                                                        Aminities = (from xx in _context.PropertyAmenity
                                                                     join yy in _context.Amenities on xx.AmenityId equals yy.AmenityId
                                                                     where xx.PropertyId == x.PropertyId
                                                                     && yy.Status == (int)Status.Active
                                                                     orderby yy.AmenityName
                                                                     select yy.AmenityName
                                                                    ).ToList(),
                                                        PropertyImages = (from xx in _context.PropertyImage where xx.PropertyId == x.PropertyId && xx.ImageType == (int)PropertyImageType.GalleryImage orderby xx.ImageName select xx.ImageName).ToList(),
                                                        PropertyDocuments = (from xx in _context.PropertyImage where xx.PropertyId == x.PropertyId && xx.ImageType == (int)PropertyImageType.Documents orderby xx.ImageName select xx.ImageName).ToList()
                                                    }).Take(8).ToListAsync();
            return properties;

        }

        public async Task<List<PropertyModel>> GetSellPropertiesForDashboardAsync()
        {
            List<PropertyModel> properties = await (from x in _context.Property
                                                    where x.Status != (int)Status.Deleted
                                                    && x.PropertyStatusId == (int)Enumerations.PropertyStatus.For_Sell
                                                    orderby x.CreatedDate descending
                                                    select new PropertyModel()
                                                    {
                                                        Address = x.Address,
                                                        BuildYear = x.BuildYear,
                                                        City = x.City,
                                                        ConstructionStatusId = x.ConstructionStatusId,
                                                        ConstructionStatus = (from xx in _context.ConstructionStatus where xx.ConstructionStatusId == x.ConstructionStatusId select xx.ConstructionStatusName).FirstOrDefault(),
                                                        Country = x.Country,
                                                        Description = x.Description,
                                                        GarageSize = x.GarageSize,
                                                        GarageSizePrefix = x.GarageSizePrefix,
                                                        MaxPrice = x.MaxPrice,
                                                        MinPrice = x.MinPrice,
                                                        PropertyId = x.PropertyId,
                                                        PropertySize = x.PropertySize,
                                                        PropertySizePrefix = x.PropertySizePrefix,
                                                        PropertyStatusId = x.PropertyStatusId,
                                                        PropertyStatusText = (from xx in _context.PropertyStatus where xx.PropertyStatusId == x.PropertyStatusId select xx.PropertyStatusName).FirstOrDefault(),
                                                        PropertyTypeId = x.PropertyTypeId,
                                                        PropertyTypeText = (from xx in _context.PropertyType where xx.PropertyTypeId == x.PropertyTypeId select xx.PropertyTypeName).FirstOrDefault(),
                                                        State = x.State,
                                                        Status = x.Status,
                                                        Title = x.Title,
                                                        TotalBathrooms = x.TotalBathrooms,
                                                        TotalGarages = Convert.ToInt32(x.TotalGarages),
                                                        TotalRooms = x.TotalRooms,
                                                        VideoUrl = x.VideoUrl,
                                                        VirtualTourUrl = x.VirtualTourUrl,
                                                        Zip = x.Zip,
                                                        Aminities = (from xx in _context.PropertyAmenity
                                                                     join yy in _context.Amenities on xx.AmenityId equals yy.AmenityId
                                                                     where xx.PropertyId == x.PropertyId
                                                                     && yy.Status == (int)Status.Active
                                                                     orderby yy.AmenityName
                                                                     select yy.AmenityName
                                                                    ).ToList(),
                                                        PropertyImages = (from xx in _context.PropertyImage where xx.PropertyId == x.PropertyId && xx.ImageType == (int)PropertyImageType.GalleryImage orderby xx.ImageName select xx.ImageName).ToList(),
                                                        PropertyDocuments = (from xx in _context.PropertyImage where xx.PropertyId == x.PropertyId && xx.ImageType == (int)PropertyImageType.Documents orderby xx.ImageName select xx.ImageName).ToList()
                                                    }).Take(8).ToListAsync();
            return properties;

        }

        public async Task<bool> DeleteProperty(Guid Id)
        {
            bool deleted = false;
            var property = _context.Property.Where(x => x.PropertyId == Id && x.Status != (int)Status.Deleted).FirstOrDefault();
            if (property != null)
            {
                property.Status = (int)Status.Deleted;
                property.ModifiedDate = DateTime.Now;
                deleted = await _context.SaveChangesAsync() > 0;
            }
            return deleted;
        }
    }
}
