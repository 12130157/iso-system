using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace SMS.common
{
    class KeyValuePair
    {
        public object m_objKey;
        public string m_strValue;

        public KeyValuePair(object NewKey, string NewValue)
        {
            m_objKey = NewKey;
            m_strValue = NewValue;
        }

        public override string ToString()
        {
            return m_strValue;
        }    
    }
}
