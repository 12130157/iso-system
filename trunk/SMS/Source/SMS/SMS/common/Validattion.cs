using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Text.RegularExpressions;

namespace SMS
{
    class Validattion
    {

        // Source Code starts
        /*
        <HowToCompile>
        csc /r:System.Text.RegularExpressions.dll,System.dll Validation.cs
        </HowToComplie>
        */

        //fuction to test for is Number



        // Function to test for Positive Integers.
        //Check positive integer +
        public bool IsNaturalNumber(String strNumber)
        {
            Regex objNotNaturalPattern = new Regex("[^0-9]");
            Regex objNaturalPattern = new Regex("0*[1-9][0-9]*");
            return !objNotNaturalPattern.IsMatch(strNumber) &&
            objNaturalPattern.IsMatch(strNumber);
        }
        // Function to test for Positive Integers with zero inclusive 0
        public bool IsWholeNumber(String strNumber)
        {
            Regex objNotWholePattern = new Regex("[^0-9]");
            return !objNotWholePattern.IsMatch(strNumber);
        }
        // Function to Test for Integers both Positive & Negative
        public bool IsInteger(String strNumber)
        {
            Regex objNotIntPattern = new Regex("[^0-9-]");
            Regex objIntPattern = new Regex("^-[0-9]+$|^[0-9]+$");
            return !objNotIntPattern.IsMatch(strNumber) && objIntPattern.IsMatch(strNumber);
        }
        // Function to Test for Positive Number both Integer & Real
        public bool IsPositiveNumber(String strNumber)
        {
            Regex objNotPositivePattern = new Regex("[^0-9.]");
            Regex objPositivePattern = new Regex("^[.][0-9]+$|[0-9]*[.]*[0-9]+$");
            Regex objTwoDotPattern = new Regex("[0-9]*[.][0-9]*[.][0-9]*");
            return !objNotPositivePattern.IsMatch(strNumber) &&
            objPositivePattern.IsMatch(strNumber) &&
            !objTwoDotPattern.IsMatch(strNumber);
        }
        // Function to test whether the string is valid number or not
        public bool IsNumber(String strNumber)
        {
            Regex objNotNumberPattern = new Regex("[^0-9.-]");
            Regex objTwoDotPattern = new Regex("[0-9]*[.][0-9]*[.][0-9]*");
            Regex objTwoMinusPattern = new Regex("[0-9]*[-][0-9]*[-][0-9]*");
            String strValidRealPattern = "^([-]|[.]|[-.]|[0-9])[0-9]*[.]*[0-9]+$";
            String strValidIntegerPattern = "^([-]|[0-9])[0-9]*$";
            Regex objNumberPattern = new Regex("(" + strValidRealPattern + ")|(" + strValidIntegerPattern + ")");
            return !objNotNumberPattern.IsMatch(strNumber) &&
            !objTwoDotPattern.IsMatch(strNumber) &&
            !objTwoMinusPattern.IsMatch(strNumber) &&
            objNumberPattern.IsMatch(strNumber);
        }
        // Function To test for Alphabets.
        public static bool IsAlpha(String strToCheck)
        {
            Regex objAlphaPattern = new Regex("[^a-zA-Z]");
            return !objAlphaPattern.IsMatch(strToCheck);
        }
        // Function to Check for AlphaNumeric.
        public Boolean IsAlphaNumeric(String strToCheck)
        {
            Regex objAlphaNumericPattern = new Regex("[^a-zA-Z0-9]");
            return !objAlphaNumericPattern.IsMatch(strToCheck);
        }

        /// <summary>
        /// method for determining is the user provided a valid email address
        /// We use regular expressions in this check, as it is a more thorough
        /// way of checking the address provided
        /// </summary>
        /// <param name="email">email address to validate</param>
        /// <returns>true is valid, false if not valid</returns>
        public bool IsValidEmail(string email)
        {
            //regular expression pattern for valid email
            //addresses, allows for the following domains:
            //com,edu,info,gov,int,mil,net,org,biz,name,museum,coop,aero,pro,tv
            string pattern = @"^[-a-zA-Z0-9][-.a-zA-Z0-9]*@[-.a-zA-Z0-9]+(\.[-.a-zA-Z0-9]+)*\.
          (com|edu|info|gov|int|mil|net|org|biz|name|museum|coop|aero|pro|tv|[a-zA-Z]{2})$";
            //Regular expression object
            Regex check = new Regex(pattern, RegexOptions.IgnorePatternWhitespace);
            //boolean variable to return to calling method
            bool valid = false;
            //make sure an email address was provided
            if (string.IsNullOrEmpty(email))
            {
                valid = false;
            }
            else
            {
                //use IsMatch to validate the address
                valid = check.IsMatch(email);
            }
            //return the value to the calling method
            return valid;
        }
        /*
        public bool isPhone ( String phone) 
        {
             Regex objPhone= new Regex ("^[1-9]\d{2}-[1-9]\d{2}-\d{4}$");

            if (regex.test(phone)) {
                // Valid international phone number
            } else {
                // Invalid international phone number
            }
        }*/

        public static bool isYear(string year)
        {
            bool result = false;
            string pattern = @"^\d{4}$";
            Regex myRegex = new Regex(pattern);
            if (string.IsNullOrEmpty(year))
            {
                result = false;
            }
            else
            {
                result = myRegex.IsMatch(year);
            }
            return result;
        }

        public static bool isSubject(string subject)
        {
            bool result = false;
            string pattern = @"^[a-zA-Z]{1,10}[0-9]*$";
            Regex myRegex = new Regex(pattern);
            if (string.IsNullOrEmpty(subject))
            {
                result = false;
            }
            else
            {
                result =myRegex.IsMatch(subject);
            }
            return result;
        }

        public static bool isSemester(string semester)
        {
            //
            bool result = false;
            string pattern = @"^((HK[1-6]|Hk[1-6]|hK[1-6]|hk[1-6])|(ALL|ALl|AlL|All|all|aLl|alL|aLL))$";
            Regex myRegex = new Regex(pattern);
            if (string.IsNullOrEmpty(semester))
            {
                result = false;
            }
            else
            {
                result = myRegex.IsMatch(semester);
            }
            return result;
        }

        public static bool isDDMMYYYY(string ddmmyyyy)
        {
            bool result = false;
            string pattern = @"^[0-9]{8}$";
            Regex myRegex = new Regex(pattern);
            if (string.IsNullOrEmpty(ddmmyyyy))
            {
                result = false;
            }
            else
            {
                result = myRegex.IsMatch(ddmmyyyy);
            }
            return result;
        }

        public static bool isMMYYYY(string mmyyyy)
        {
            bool result = false;
            string pattern = @"^[0-9]{6}$";
            Regex myRegex = new Regex(pattern);
            if (string.IsNullOrEmpty(mmyyyy))
            {
                result = false;
            }
            else
            {
                result = myRegex.IsMatch(mmyyyy);
            }
            return result;
        }
    }
}
