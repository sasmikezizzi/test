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
 
data _null_;
 rc=GITFN_IDX_ADD("/tmp/anewtest", "testprogram.sas", "new", "Program 1", "new", "testcars.sas7bdat", "new");
run;

data _null_;
 rc=GITFN_IDX_REMOVE("/tmp/anewtest", "testprogram.sas", "Program 1", "testcars.sas7bdat");
run;

data _null_;
 rc=GITFN_COMMIT("/tmp/anewtest", "HEAD", "Mike", "mike.zizzi@sas.com", "command commit");
run;


data _null_;
 rc=GITFN_PUSH("/tmp/anewtest", "git", "", "/r/ge.unx.sas.com/vol/vol110/u11/mizizz/ssh/id_rsa.pub", "/r/ge.unx.sas.com/vol/vol110/u11/mizizz/ssh/id_rsa");
run;

data _null_;
 rc=GITFN_PULL("/tmp/anewtest", "git", "", "/r/ge.unx.sas.com/vol/vol110/u11/mizizz/ssh/id_rsa.pub", "/r/ge.unx.sas.com/vol/vol110/u11/mizizz/ssh/id_rsa");
run;

data _null_;
    n = GITFN_COMMIT_LOG("/tmp/anewtest");
    put n=;
run;

data work.x;
N=1;
LENGTH COMMIT_ID $ 1024;
LENGTH AUTHOR_NAME $ 1024;
LENGTH AUTHOR_EMAIL $ 1024;
LENGTH MESSAGE $ 1024;
LENGTH PARENT_IDS $ 1024;
LENGTH TIME $ 1024;
TIME="";
COMMIT_ID="";
AUTHOR_NAME="";
AUTHOR_EMAIL="";
MESSAGE="";
PARENT_IDS="";
N = GITFN_COMMIT_LOG("/tmp/anewtest");
PUT N=;
DO I=1 TO N;
	rc=GITFN_COMMIT_GET(I,"/tmp/anewtest", "id", COMMIT_ID);
	rc=GITFN_COMMIT_GET(I,"/tmp/anewtest", "author", AUTHOR_NAME);
	rc=GITFN_COMMIT_GET(I,"/tmp/anewtest", "email", AUTHOR_EMAIL);
	rc=GITFN_COMMIT_GET(I,"/tmp/anewtest", "message", MESSAGE);
	rc=GITFN_COMMIT_GET(I,"/tmp/anewtest", "parent_ids", PARENT_IDS);
	rc=GITFN_COMMIT_GET(I,"/tmp/anewtest", "time", TIME);
	PUT COMMIT_ID=;
	PUT AUTHOR_NAME=;
	PUT AUTHOR_EMAIL=;
	PUT MESSAGE=;
	PUT PARENT_IDS=;
	PUT TIME=;
	output;
END;
RC = GITFN_COMMITFREE("/tmp/anewtest");
run;
proc print data=work.x; run;


data _null_;
    n = GITFN_DIFF("/tmp/anewtest", "ea9135ddad641620546e56cecaa9a5b2f6109662", "73933dc76b0a98593a171d227367ae95204e3623");
    put n=;
run;

data work.x;
LENGTH FILE_PATH $ 1024;
LENGTH DIFF_CONTENT $ 1024;
LENGTH DIFF_TYPE $ 1024;
FILE_PATH="";
DIFF_CONTENT="";
DIFF_TYPE="";
N = GITFN_DIFF("/tmp/anewtest", "ea9135ddad641620546e56cecaa9a5b2f6109662", "73933dc76b0a98593a171d227367ae95204e3623");
PUT N=;
DO I=1 TO N;
	RC = GITFN_DIFF_GET(I,"/tmp/anewtest", "ea9135ddad641620546e56cecaa9a5b2f6109662", "73933dc76b0a98593a171d227367ae95204e3623", "file", FILE_PATH);
	RC = GITFN_DIFF_GET(I,"/tmp/anewtest", "ea9135ddad641620546e56cecaa9a5b2f6109662", "73933dc76b0a98593a171d227367ae95204e3623", "diff_content", DIFF_CONTENT);
	RC = GITFN_DIFF_GET(I,"/tmp/anewtest", "ea9135ddad641620546e56cecaa9a5b2f6109662", "73933dc76b0a98593a171d227367ae95204e3623", "diff_type", DIFF_TYPE);
	PUT FILE_PATH=;
	PUT DIFF_CONTENT=;
	PUT DIFF_TYPE=;
	output;
END;
RC = GITFN_DIFF_FREE("/tmp/anewtest", "3a34b70191602dcadfad68b5031f072df39ee90e", "73933dc76b0a98593a171d227367ae95204e3623");
 
run;
proc print data=work.x; 
run;

data work.reset;
reset = GITFN_RESET("/tmp/anewtest", "3a34b70191602dcadfad68b5031f072df39ee90e", "MIXED");
run;





