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

data _null_;
 rc= gitfn_push(
  "/tmp/anewtest",
  "git",
  "",
  "/r/ge.unx.sas.com/vol/vol110/u11/mizizz/ssh/id_rsa.pub",
  "/r/ge.unx.sas.com/vol/vol110/u11/mizizz/ssh/id_rsa");
 put rc=;
run;

data _null_;
 rc= gitfn_pull(
  "/tmp/anewtest",
  "git",
  "",
  "/r/ge.unx.sas.com/vol/vol110/u11/mizizz/ssh/id_rsa.pub",
  "/r/ge.unx.sas.com/vol/vol110/u11/mizizz/ssh/id_rsa");
 put rc=;
run;


data _null_;
 n = GITFN_COMMIT_LOG("/tmp/anewtest");
 put n=;
run;

data _null_;
 length atrout $ 1024;
 atrout="";
 rc = GITFN_COMMIT_GET(21,"/tmp/anewtest", "id", atrout);
 put rc=;
 put atrout=;
run;

data _null_;
 rc = gitfn_commitfree("/tmp/anewtest");
 put rc=;                                     
run;

data _null_;
 length atrout $ 1024;
 atrout="";
 rc = GITFN_COMMIT_GET(20,"/tmp/anewtest", "id", atrout);
 put rc=;
 put atrout=;
run;

data _null_;
 n=gitfn_diff("/tmp/anewtest",
 "bf735c3a546ad8c228a616219c6b6e3808baa764",
 "ef350cee6d6507a84577a6a9e19683e8fffab78a");
 put n=;
run;

data _null_;
 length atrout $ 1024;
 atrout="";
 rc=gitfn_diff_get(1,"/tmp/anewtest",
 "bf735c3a546ad8c228a616219c6b6e3808baa764",
 "ef350cee6d6507a84577a6a9e19683e8fffab78a",
 "diff_content",
 atrout);
 put rc=;
 put atrout;
run;


