xquery version "1.0" encoding "utf-8";

(:: OracleAnnotationVersion "1.0" ::)

declare namespace ns2="http://www.example.org";
(:: import schema at "../../Services/Internal/XSD/Response.xsd" ::)
declare namespace ns1="http://www.howtodoinjava.com/xml/school";
(:: import schema at "../../Services/External/XSD/school.xsd" ::)

declare variable $response1 as element() (:: schema-element(ns1:StudentDetailsResponse) ::) external;

declare function local:func($response1 as element() (:: schema-element(ns1:StudentDetailsResponse) ::)) as element() (:: element(*, ns2:Student) ::) {
    <ns2:Student>
        <ns2:name>{fn:data($response1/ns1:Student/ns1:name)}</ns2:name>
        <ns2:lastName>{fn:data($response1/ns1:Student/ns1:lastName)}</ns2:lastName>
    </ns2:Student>
};

local:func($response1)
