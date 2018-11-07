libname anewlib "/tmp/anewtest";

data _null_;
   version=GITFN_VERSION();
   put version=;
run;

data _null_;
    rc = GITFN_CLONE("git@github.com:sasmikezizzi/test.git", "/tmp/anewtest", "git", "", "/r/ge.unx.sas.com/vol/vol110/u11/mizizz/ssh/id_rsa.pub", "/r/ge.unx.sas.com/vol/vol110/u11/mizizz/ssh/id_rsa");
    put rc=;
run;

data _null_;
    n = GITFN_STATUS("/tmp/anewtest");
    put n=;
run;