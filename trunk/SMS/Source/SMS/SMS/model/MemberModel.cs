using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace SMS.model
{
    class MemberModel
    {
        private String memID;
        private String username;
        private String password;
        private String fullName;
        private String roleID;
        private String createDate;
        private String lastLogin;
        private String lastUpdate;
        private String partID;
        private String roleName;
        private String user1;
        private String user2;
        private String user3;
        private String user4;
        private String user5;

        public String MemID
        {
            get { return memID; }
            set { memID = value; }
        }
        
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

        public String FullName
        {
            get { return fullName; }
            set { fullName = value; }
        }

        public String RoleID
        {
            get { return roleID; }
            set { roleID = value; }
        }
        
        public String CreateDate
        {
            get { return createDate; }
            set { createDate = value; }
        }
        
        public String LastLogin
        {
            get { return lastLogin; }
            set { lastLogin = value; }
        }

        public String LastUpdate
        {
            get { return lastUpdate; }
            set { lastUpdate = value; }
        }

        public String PartID
        {
            get { return partID; }
            set { partID = value; }
        }

        public String RoleName
        {
            get { return roleName; }
            set { roleName = value; }
        }

        public String User1
        {
            get { return user1; }
            set { user1 = value; }
        }

        public String User2
        {
            get { return user2; }
            set { user2 = value; }
        }

        public String User3
        {
            get { return user3; }
            set { user3 = value; }
        }

        public String User4
        {
            get { return user4; }
            set { user4 = value; }
        }

        public String User5
        {
            get { return user5; }
            set { user5 = value; }
        }
    }
}
