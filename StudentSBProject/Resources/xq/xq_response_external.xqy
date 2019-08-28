xquery version "1.0" encoding "utf-8";

(:: OracleAnnotationVersion "1.0" ::)

declare namespace ns1="http://www.example.org";
(:: import schema at "../../Services/Internal/XSD/Response.xsd" ::)
declare namespace ns2="http://www.howtodoinjava.com/xml/school";
(:: import schema at "../../Services/External/XSD/student.xsd" ::)

declare variable $response as element() (:: schema-element(ns2:StudentDetailsResponse) ::) external;

declare function local:func($response as element() (:: schema-element(ns2:StudentDetailsResponse) ::)) as element() (:: element(*, ns1:Student) ::) {
    <ns1:Student>
        <ns1:name>{fn:data($response/ns2:Student/ns2:name)}</ns1:name>
        <ns1:lastName>{fn:data($response/ns2:Student/ns2:lastName)}</ns1:lastName>
    </ns1:Student>
};

local:func($response)
