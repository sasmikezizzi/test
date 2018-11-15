libname anewlib "/tmp/anewtest";

data _null_;
    n = GITFN_STATUS("/tmp/anewtest");
    put n=;
run;