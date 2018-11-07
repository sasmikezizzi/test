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

data _null_;
LENGTH path $ 1024;
	LENGTH status $ 1024;
	LENGTH staged $ 32;
	LENGTH bogus $ 32;
 
	path="";
	status="";
	staged="";
	bogus="";
 n = GITFN_STATUS("/tmp/anewtest");

 
    DO i=1 to N;
       rc=GITFN_STATUS_GET(i,"/tmp/anewtest","PATH",path);
       put rc=;
       put path=;
       rc=GITFN_STATUS_GET(i,"/tmp/anewtest","STATUS",status);
       put rc=;
       put status=;
       rc=GITFN_STATUS_GET(i,"/tmp/anewtest","STAGED",staged);
       put rc=;
       put staged=;
 
    END;
    rc=GITFN_STATUSFREE("/tmp/anewtest");
    put rc=;
 run;