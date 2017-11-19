using System;
using System.Collections.Generic;
using System.Web;

namespace DnD.Model.Entity
{
    [Serializable]
    public class SessionManager
    {
        /// <summary>
        /// Gets the current session for the logged in user.
        /// </summary>
        public static SessionManager Current
        {
            get
            {
                SessionManager session;

                //check if session object is null
                if (HttpContext.Current.Session == null)
                {
                    return new SessionManager();
                }
                //return the sessionManager object from session
                session = HttpContext.Current.Session["__SessionManager__"] as SessionManager;

                if (session == null)
                {
                    session = new SessionManager();
                    HttpContext.Current.Session["__SessionManager__"] = session;
                }
                return session;
            }
            set
            {
                HttpContext.Current.Session["__SessionManager__"] = value;
            }
        }

        /// <summary>
        /// Returns Product Images
        /// </summary>
        public List<ProductImage> ProductImages { get; set; }

    }
}
