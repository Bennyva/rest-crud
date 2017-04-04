var mysql = require("mysql");
function REST_ROUTER(router,connection,md5) {
    var self = this;
    self.handleRoutes(router,connection,md5);
}



REST_ROUTER.prototype.handleRoutes= function(router,connection,md5) {
    REST_ROUTER.prototype.handleRoutes= function(router,connection,md5) {
	    router.get("/",function(req,res){
	       // res.sendfile("login.html" );
	    })
	}





    /*router.post("/users",function(req,res){
        var query = "INSERT INTO ??(??,??) VALUES (?,?)";
        var table = ["user_login","user_email","user_password",req.body.email,md5(req.body.password)];
        query = mysql.format(query,table);
        connection.query(query,function(err,rows){
            if(err) {
                res.json({"Error" : true, "Message" : "Error executing MySQL query"});
            } else {
                res.json({"Error" : false, "Message" : "User Added !"});
            }
        });
    });
	
	router.get("/users",function(req,res){
        var query = "SELECT * FROM ??";
        var table = ["user_login"];
        query = mysql.format(query,table);
        connection.query(query,function(err,rows){
            if(err) {
                res.json({"Error" : true, "Message" : "Error executing MySQL query"});
            } else {
                res.json({"Error" : false, "Message" : "Successes", "Users" : rows});
            }
        });
    });

    router.get("/users/:user_id",function(req,res){
        var query = "SELECT * FROM ?? WHERE ??=?";
        var table = ["user_login","user_id",req.params.user_id];
        query = mysql.format(query,table);
        connection.query(query,function(err,rows){
            if(err) {
                res.json({"Error" : true, "Message" : "Error executing MySQL query"});
            } else {
                res.json({"Error" : false, "Message" : "Success", "Users" : rows});
            }
        });
    });
	
	router.put("/users",function(req,res){
        var query = "UPDATE ?? SET ?? = ? WHERE ?? = ?";
        var table = ["user_login","user_password",md5(req.body.password),"user_email",req.body.email];
        query = mysql.format(query,table);
        connection.query(query,function(err,rows){
            if(err) {
                res.json({"Error" : true, "Message" : "Error executing MySQL query"});
            } else {
                res.json({"Error" : false, "Message" : "Updated the password for email "+req.body.email});
            }
        });
    });
	
	router.delete("/users/:email",function(req,res){
        var query = "DELETE from ?? WHERE ??=?";
        var table = ["user_login","user_email",req.params.email];
        query = mysql.format(query,table);
        connection.query(query,function(err,rows){
            if(err) {
                res.json({"Error" : true, "Message" : "Error executing MySQL query"});
            } else {
                res.json({"Error" : false, "Message" : "Deleted the user with email "+req.params.email});
            }
        });
    });*/

    router.get("/categories",function(req,res){
        var query = "SELECT * FROM ??";
        var table = ["categories"];
        query = mysql.format(query,table);
        connection.query(query,function(err,rows){
            if(err) {
                res.json({"Error" : true, "Message" : "Error executing MySQL query" + err});
            } else {
                res.json({"Error" : false, "Message" : "Successes", "Categories" : rows});
            }
        });
    });

    router.get("/questions",function(req,res){
        var query = "SELECT * FROM ??";
        var table = ["questions"];
        query = mysql.format(query,table);
        connection.query(query,function(err,rows){
            if(err) {
                res.json({"Error" : true, "Message" : "Error executing MySQL query"});
            } else {
                res.json({"Error" : false, "Message" : "Successes", "Questions" : rows});
            }
        });
    });

    router.get("/answers",function(req,res){
        var query = "SELECT * FROM ??";
        var table = ["answers"];
        query = mysql.format(query,table);
        connection.query(query,function(err,rows){
            if(err) {
                res.json({"Error" : true, "Message" : "Error executing MySQL query"});
            } else {
                res.json({"Error" : false, "Message" : "Successes", "Answers" : rows});
            }
        });


    });

    router.get("/questions/:category_id",function(req,res){
        var query = "SELECT * FROM ?? WHERE ??=?";
        var table = ["questions","category_id",req.params.category_id];
        query = mysql.format(query,table);
        connection.query(query,function(err,rows){
            if(err) {
                res.json({"Error" : true, "Message" : "Error executing MySQL query"});
            } else {
                res.json({"Error" : false, "Message" : "Success", "QuestionsPerCategoryID" : rows});
            }
        });
    });

    router.get("/answers/:category_id",function(req,res){
        var query = "SELECT * FROM ?? WHERE ??=?";
        var table = ["answers","category_id",req.params.category_id];
        query = mysql.format(query,table);
        connection.query(query,function(err,rows){
            if(err) {
                res.json({"Error" : true, "Message" : "Error executing MySQL query"});
            } else {
                res.json({"Error" : false, "Message" : "Success", "AnswersPerCategoryID" : rows});
            }
        });
    });

    router.post("/questions/add",function(req,res){
        /*res.sendfile("loginSent.html");*/
        var query = "INSERT INTO ??(??,??,??) VALUES (?,?,?)";
        var table = ["questions","category_id", "question_text", "question_type_id" ,req.body.categoryID, req.body.questionText, req.body.questionTypeID];
        query = mysql.format(query,table);
        connection.query(query,function(err,rows){
            if(err) {
                res.json({"Error" : true + err, "Message" : "Error executing insert MySQL query"});
            } else {
            	console.log(res.body);
                res.json({"Error" : false, "Message" : "Question Added !", "New Question " : rows.insertId});
            }
        });
    });

    router.post("/process_questions",function(req,res){
            res.render('loginSent.html', {name: req.body.questionID});
            console.log("wow");
        });



    router.get("/users",function(req,res){
        var query = "SELECT * FROM ??";
        var table = ["users"];
        query = mysql.format(query,table);
        connection.query(query,function(err,rows){
            if(err) {
                res.json({"Error" : true, "Message" : "Error executing MySQL query"});
            } else {
                res.json({"Error" : false, "Message" : "Successes", "Users" : rows});
            }
        });
    });

    router.post("/users", function(req,res){
        var query = "INSERT INTO ??(??,??,??,??,??) VALUES (?,?,?,?,?)";
        var table = ["users","user_email", "last_log_in", "log_in_count", "user_first_name", "user_last_name" ,req.body.userEmail, req.body.lastLogIn, req.body.logInCount, req.body.userFirstName, req.body.userLastName];
        query = mysql.format(query,table);
        connection.query(query,function(err,rows){
            if(err) {
                res.json({"Error" : true + err, "Message" : "Error executing insert MySQL query"});
            } else {
                console.log(req.body);
                res.json({"Error" : false, "Message" : "User Added !", "New User " : rows.question_id});
            }
        });
    });

    router.put("/users",function(req,res){
        var query = "UPDATE ?? SET ?? = ?, ?? = ? WHERE ?? = ?";
        var table = ["users","last_log_in",req.body.lastLogIn,"log_in_count",req.body.logInCount, "user_email", req.body.userEmail];
        query = mysql.format(query,table);
        connection.query(query,function(err,rows){
            if(err) {
                res.json({"Error" : true, "Message" : "Error executing MySQL query"});
            } else {
                console.log(req.body);
                res.json({"Error" : false, "Message" : "Updated the user "+req.body.userEmail});
            }
        });
    });
    
    router.post("/results", function(req,res){
        var query = "INSERT INTO ??(??,??,??,??,??) VALUES (?,?,?,?,?)";
        var table = ["results","result_score", "user_id", "category_id", "total_length", "date_written" ,req.body.resultScore, req.body.userID, req.body.categoryID, req.body.totalLength, req.body.dateWritten];
        query = mysql.format(query,table);
        connection.query(query,function(err,rows){
            if(err) {
                res.json({"Error" : true + err, "Message" : "Error executing insert MySQL query"});
            } else {
                console.log(req.body);
                res.json({"Error" : false, "Message" : "Result Added !", "New Result " : rows});
            }
        });
    });


    router.get("/results/:category_id",function(req,res){
        var query = "SELECT * FROM ?? WHERE ??=? ORDER BY ?? DESC" ;
        var table = ["results","category_id",req.params.category_id, "result_id"];
        query = mysql.format(query,table);
        connection.query(query,function(err,rows){
            if(err) {
                res.json({"Error" : true, "Message" : "Error executing MySQL query"});
            } else {
                res.json({"Error" : false, "Message" : "Success", "ResultsPerCategory" : rows});
            }
        });
    });


    

//add per user id next
    router.get("/results/:category_id/:user_id",function(req,res){
        var query = "SELECT * FROM ?? WHERE ??=? AND ??=? ORDER BY ?? DESC";
        var table = ["results","category_id",req.params.category_id, "user_id",req.params.user_id, "result_id"];
        query = mysql.format(query,table);
        connection.query(query,function(err,rows){
            if(err) {
                res.json({"Error" : true, "Message" : "Error executing MySQL query"});
            } else {
                res.json({"Error" : false, "Message" : "Success", "ResultsPerCategory" : rows});
            }
        });
    });

    //transaction with multiple inserts for admin panel

    router.post("/questions/addWA",function(req,res){
        if(req.body.categoryID === null){
                res.render('error.html');
        }else{
        
            connection.beginTransaction(function(err) {
              if (err) { throw err; }
              var query = "INSERT INTO ??(??,??,??) VALUES (?,?,?)";
              var table = ["questions","category_id", "question_text", "question_type_id" ,req.body.categoryID, req.body.questionText, req.body.questionTypeID];
              query = mysql.format(query,table);
             
              connection.query(query,function(err,rows){
                if (err) { 
                connection.rollback(function() {
                    res.json({"Error" : true + err, "Error: ->" : "executing insert MySQL query"});
                    console.log("Error" + err);
                    throw err;
                  });
                } else {
                    console.log("Success on Question :" + req.body);
                    //res.json({"Success: " : "Question Added !"});
                    res.render('loginSent.html');
                    var questionID = rows.insertId;
                } 

               // var log = 'Question ' + rows.question_id + ' added';
                

                var query = "INSERT INTO ??(??,??,??,??) VALUES (?,?,?,?)";
                var table = ["answers","question_id", "isCorrect", "answer_text", "category_id" ,questionID, req.body.isCorrect, req.body.answerText, req.body.categoryID];
                query = mysql.format(query,table);

                connection.query(query,function(err, rows) {
                  if (err) { 
                    connection.rollback(function() {
                      //res.json({"Error" : true + err, "Message" : "Error executing insert MySQL query"});
                      throw err;
                    });
                  }  
                  connection.commit(function(err) {
                    if (err) { 
                      connection.rollback(function() {
                        //res.json({"Error" : true + err, "Message" : "Error executing insert MySQL query"});
                        throw err;
                      });
                    } else{
                        console.log(req.body);
                        //res.json({"Error" : false, "Message" : "Question Added !", "New Question " : rows});
                        console.log('success!');
                    }
                    
                  });
                });

                // ============
                //ANSWER TWO
                //===========
                var query = "INSERT INTO ??(??,??,??,??) VALUES (?,?,?,?)";
                var table = ["answers","question_id", "isCorrect", "answer_text", "category_id" ,questionID, req.body.isCorrect2, req.body.answerText2, req.body.categoryID];
                query = mysql.format(query,table);

                connection.query(query,function(err, rows) {
                  if (err) { 
                    connection.rollback(function() {
                      //res.json({"Error" : true + err, "Message" : "Error executing insert MySQL query"});
                      throw err;
                    });
                  }  
                  connection.commit(function(err) {
                    if (err) { 
                      connection.rollback(function() {
                        //res.json({"Error" : true + err, "Message" : "Error executing insert MySQL query"});
                        throw err;
                      });
                    } else{
                        console.log(req.body);
                        //res.json({"Error" : false, "Message" : "Question Added !", "New Question " : rows});
                        console.log('success!');
                    }
                    
                  });
                });

                // ============
                //ANSWER THREE
                //===========
                var query = "INSERT INTO ??(??,??,??,??) VALUES (?,?,?,?)";
                var table = ["answers","question_id", "isCorrect", "answer_text", "category_id" ,questionID, req.body.isCorrect3, req.body.answerText3, req.body.categoryID];
                query = mysql.format(query,table);

                connection.query(query,function(err, rows) {
                  if (err) { 
                    connection.rollback(function() {
                      //res.json({"Error" : true + err, "Message" : "Error executing insert MySQL query"});
                      throw err;
                    });
                  }  
                  connection.commit(function(err) {
                    if (err) { 
                      connection.rollback(function() {
                        //res.json({"Error" : true + err, "Message" : "Error executing insert MySQL query"});
                        throw err;
                      });
                    } else{
                        console.log(req.body);
                        //res.json({"Error" : false, "Message" : "Question Added !", "New Question " : rows});
                        console.log('success!');
                    }
                    
                  });
                });


                // ============
                //ANSWER FOUR
                //===========
                var query = "INSERT INTO ??(??,??,??,??) VALUES (?,?,?,?)";
                var table = ["answers","question_id", "isCorrect", "answer_text", "category_id" ,questionID, req.body.isCorrect4, req.body.answerText4, req.body.categoryID];
                query = mysql.format(query,table);


                connection.query(query,function(err, rows) {
                  if (err) { 
                    connection.rollback(function() {
                      //res.json({"Error" : true + err, "Message" : "Error executing insert MySQL query"});
                      throw err;
                    });
                  }  
                  connection.commit(function(err) {
                    if (err) { 
                      connection.rollback(function() {
                        //res.json({"Error" : true + err, "Message" : "Error executing insert MySQL query"});
                        throw err;
                      });
                    } else{
                        console.log(req.body);
                        //res.json({"Error" : false, "Message" : "Question Added !", "New Question " : rows});
                        console.log('success!');
                    }
                    
                  });
                });
              });
            });  
        }
    });

        
    

    



	
}

module.exports = REST_ROUTER;