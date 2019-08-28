xquery version "1.0" encoding "utf-8";

(:: OracleAnnotationVersion "1.0" ::)

declare namespace ns2="http://www.example.org";
(:: import schema at "../../Services/Internal/XSD/Request.xsd" ::)
declare namespace ns1="http://www.howtodoinjava.com/xml/school";
(:: import schema at "../../Services/External/XSD/school.xsd" ::)

declare variable $request as element() (:: schema-element(ns2:StudentDetailsRequest) ::) external;

declare function local:func($request as element() (:: schema-element(ns2:StudentDetailsRequest) ::)) as element() (:: schema-element(ns1:StudentDetailsRequest) ::) {
    <ns1:StudentDetailsRequest>
        <ns1:name>{fn:data($request/ns2:name)}</ns1:name>
    </ns1:StudentDetailsRequest>
};

local:func($request)
