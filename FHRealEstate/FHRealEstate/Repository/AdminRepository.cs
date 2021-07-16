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
        Task<List<TextValueInt>> GetPropertyTypeList();
        Task<List<TextValueInt>> GetPropertyStatusList();
        Task<List<TextValueInt>> GetConstructionStatusList();
        Task<bool> AddUpdateProperty(AddUpdatePropertyModel model);
        Task<PropertyModel> GetPropertyAsync(Guid propertyId);
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
        public async Task<bool> AddUpdateProperty(AddUpdatePropertyModel model)
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
            if (model.ImageFiles != null && model.ImageFiles.Count > 0)
            {
                model.ImageFiles.ToList().ForEach(x =>
                {
                    _context.PropertyImage.Add(new PropertyImage()
                    {
                        ImageName = x.FileName,
                        ImageType = (int)PropertyImageType.GalleryImage,
                        PropertyId = property.PropertyId,
                        PropertyImageId = Guid.NewGuid(),
                        CreatedDate = DateTime.Now,
                        CreatedBy = UserSession.UserId
                    });
                });
            }

            #endregion

            #region Add Property Documents
            if (model.DocumentFiles != null && model.DocumentFiles.Count > 0)
            {
                model.DocumentFiles.ToList().ForEach(x =>
                {
                    _context.PropertyImage.Add(new PropertyImage()
                    {
                        ImageName = x.FileName,
                        ImageType = (int)PropertyImageType.Documents,
                        PropertyId = property.PropertyId,
                        PropertyImageId = Guid.NewGuid(),
                        CreatedDate = DateTime.Now,
                        CreatedBy = UserSession.UserId
                    });
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
                    TotalGarages = x.TotalGarages,
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

    }
}
