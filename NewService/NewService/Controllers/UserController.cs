using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using NewService.Models;

namespace NewService.Controllers
{
    public class UserController : ApiController
    {
        TestDatabaseEntities db = new TestDatabaseEntities();
        [HttpGet]
        public HttpResponseMessage allUser()
        {
            try
            {

                var user = db.Users.OrderBy(u => u.Gender).ToList();
                return Request.CreateResponse(HttpStatusCode.OK, user);
            }
            catch (Exception e)
            {
                return Request.CreateErrorResponse(HttpStatusCode.InternalServerError, e.Message);
            }
        }
        [HttpGet]
        public HttpResponseMessage UserLogin(String ContactNo, String password)
        {
            try
            {
                var user = db.Users.FirstOrDefault(u => u.Mobile == ContactNo && u.Password == password);
                return Request.CreateResponse(HttpStatusCode.OK, user);

            }
            catch (Exception e)
            {
                return Request.CreateErrorResponse(HttpStatusCode.InternalServerError, e.Message);
            }
        }
        [HttpPost]
        public HttpResponseMessage addUser(User user)
        {

            try
            {
                db.Users.Add(user);
                db.SaveChanges();
                return Request.CreateResponse(HttpStatusCode.OK, user);

            }
            catch (Exception e)
            {
                return Request.CreateErrorResponse(HttpStatusCode.InternalServerError, e.Message);
            }

        }

        [HttpGet]
        public HttpResponseMessage allCourses()
        {
            try
            {

                var course = db.Courses.OrderBy(u => u.author).ToList();
                return Request.CreateResponse(HttpStatusCode.OK,course);
            }
            catch (Exception e)
            {
                return Request.CreateErrorResponse(HttpStatusCode.InternalServerError, e.Message);
            }
        }

        [HttpGet]
        public HttpResponseMessage deleteCourse(int cid)
        {
            try
            {
                var course = db.Courses.FirstOrDefault(g => g.cid == cid);
                db.Courses.Remove(course);
                db.SaveChanges();
                return Request.CreateResponse(HttpStatusCode.OK, course);


            }
            catch (Exception e)
            {
                return Request.CreateErrorResponse(HttpStatusCode.InternalServerError, e.Message);
            }

            //try
            //{
            //    var original = db.Courses.Find(cid);
            //    if (original == null)
            //    {
            //        return Request.CreateResponse(HttpStatusCode.NotFound,"Not found");
            //    }
            //    db.Entry(original).State = System.Data.EntityState.Deleted;
            //    db.SaveChanges();
            //    return Request.CreateResponse(HttpStatusCode.OK,"Deleted");


            //}
            //catch (Exception e)
            //{
            //    return Request.CreateErrorResponse(HttpStatusCode.InternalServerError, e.Message);
            //}


        }

        [HttpGet]
        public HttpResponseMessage ModifyCourse(Cours course) 
        {
            try
            {
                var original = db.Courses.Find(course.cid);
                if (original == null)
                {
                    return Request.CreateResponse(HttpStatusCode.NotFound, "Data not found");
                }
                db.Entry(original).CurrentValues.SetValues(original);

                db.SaveChanges();
                return Request.CreateResponse(HttpStatusCode.OK,"Data Modified");


            }
            catch (Exception e)
            {
                return Request.CreateErrorResponse(HttpStatusCode.InternalServerError, e.Message);
            }
   
        }

       

    }
}