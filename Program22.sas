libname anewlib "/tmp/anewtest";




data _null_;
    n = GITFN_STATUS("/tmp/anewtest");
    put n=;
run;

data _null_;
length pathstore $ 1024;
pathstore="test";
    x = GITFN_STATUS_GET(1,"/tmp/anewtest","PATH",pathstore);
    put pathstore=;
    put x=;
run;

data _null_;
 n = GITFN_STATUSFREE("/tmp/anewtest");
 put n=;
run;