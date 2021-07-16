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

    public interface IUser
    {
        Task<User> AuthenticateUser(LoginModel model);
        Task<UserModel> GetUserByIdAsync(Guid UserId);
        Task<bool> AddUserAsync(SignupModel model);
        Task<bool> CheckUserExists(string email);
    }

    public class UserRepository : IUser
    {
        public FHRealEstateContext _context;
        private AuthenticationHelper _authenticationHelper;

        public UserRepository(FHRealEstateContext context, AuthenticationHelper authenticationHelper)
        {
            _context = context;
            _authenticationHelper = authenticationHelper;
        }

        public async Task<User> AuthenticateUser(LoginModel model)
        {

            ResponseModel response = new ResponseModel();

            var user = await _context.User.Where(x => x.Email == model.Email).FirstOrDefaultAsync();
            if (user != null)
            {
                string passwordhash = string.Empty;
                passwordhash = _authenticationHelper.GetSaltedHashedText(model.Password, user.Passwordsalt);
                if (user.Passwordhash == passwordhash)
                {
                    return user;
                }
            }
            return null;
        }

        public async Task<UserModel> GetUserByIdAsync(Guid UserId)
        {
            UserModel response = new UserModel();
            var user = await _context.User.Where(x => x.Id == UserId && x.Status != (int)Enumerations.Status.Deleted).FirstOrDefaultAsync();
            if (user != null)
            {
                response = new UserModel()
                {
                    Birthdate = user.Birthdate,
                    Displayofficialbadge = user.Displayofficialbadge,
                    Email = user.Email,
                    Emailverificationlink = user.Emailverificationlink,
                    Emailverified = user.Emailverified,
                    Emailverifieddate = user.Emailverifieddate,
                    Firstname = user.Firstname,
                    Gender = user.Gender,
                    Id = user.Id,
                    Lastname = user.Lastname,
                    Middlename = user.Middlename ?? string.Empty,
                    Profilephoto = user.Profilephoto,
                    Status = user.Status
                };
            }
            return response;
        }

        public async Task<bool> AddUserAsync(SignupModel model)
        {
            bool result = false;
            if (!_context.User.Any(x => x.Email.Trim().ToLower() == model.Email.Trim().ToLower()))
            {
                string salt = _authenticationHelper.GenerateSalt();
                User user = new User()
                {
                    Createddate = DateTime.Now,
                    Email = model.Email,
                    Firstname = model.FirstName,
                    Lastname = model.LastName,
                    Passwordhash = _authenticationHelper.GetSaltedHashedText(model.Password, salt),
                    Passwordsalt = salt,
                };
                await _context.User.AddAsync(user);
                await _context.SaveChangesAsync();
                result = true;
            }
            return result;
        }

        public async Task<bool> CheckUserExists(string email)
        {
            try
            {
                return await _context.User.AnyAsync(x => x.Email.Trim().ToLower() == email.Trim().ToLower());
            }
            catch (Exception ex)
            {
                return true;
                throw ex;
            }
        }

    }
}
