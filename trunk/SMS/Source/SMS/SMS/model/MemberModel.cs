using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace SMS.model
{
    class MemberModel
    {
        private String username;
        private String password;

        public String Username
        {
            get { return username; }
            set { username = value; }
        }
        
        public String Password
        {
            get { return password; }
            set { password = value; }
        }
    }
}
