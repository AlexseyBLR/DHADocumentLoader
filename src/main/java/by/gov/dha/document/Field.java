
package by.gov.dha.document;

import javax.xml.bind.annotation.*;


/**
 * <p>Java class for Field complex type.
 *
 * <p>The following schema fragment specifies the expected content contained within this class.
 *
 * <pre>
 * &lt;complexType name="Field">
 *   &lt;simpleContent>
 *     &lt;extension base="&lt;http://www.w3.org/2001/XMLSchema>string">
 *       &lt;attribute name="num" type="{http://www.w3.org/2001/XMLSchema}int" />
 *       &lt;attribute name="path" type="{http://www.w3.org/2001/XMLSchema}string" />
 *     &lt;/extension>
 *   &lt;/simpleContent>
 * &lt;/complexType>
 * </pre>
 *
 *
 */
@XmlAccessorType(XmlAccessType.FIELD)
@XmlType(name = "Field", namespace = "http://document.dha.gov.by", propOrder = {
    "value",
        "path",
        "sql"
})
public class Field {

    @XmlValue
    protected String value;
    @XmlAttribute(name = "num")
    protected Integer num;
    @XmlAttribute(name = "path")
    protected String path;
    @XmlAttribute(name = "sql")
    protected String sql;


    public String getSql() {
        return sql;
    }

    public void setSql(String sql) {
        this.sql = sql;
    }

    public String getPath() {
        return path;
    }

    public void setPath(String path) {
        this.path = path;
    }

    /**
     * Gets the value of the value property.
     *
     * @return
     *     possible object is
     *     {@link String }
     *
     */
    public String getValue() {
        return value;
    }

    /**
     * Sets the value of the value property.
     *
     * @param value
     *     allowed object is
     *     {@link String }
     *
     */
    public void setValue(String value) {
        this.value = value;
    }

    /**
     * Gets the value of the num property.
     *
     * @return
     *     possible object is
     *     {@link Integer }
     *
     */
    public Integer getNum() {
        return num;
    }

    /**
     * Sets the value of the num property.
     *
     * @param value
     *     allowed object is
     *     {@link Integer }
     *
     */
    public void setNum(Integer value) {
        this.num = value;
    }

}
