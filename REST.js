var mysql = require("mysql");
function REST_ROUTER(router,connection,md5) {
    var self = this;
    self.handleRoutes(router,connection,md5);
}

REST_ROUTER.prototype.handleRoutes= function(router,connection,md5) {
    REST_ROUTER.prototype.handleRoutes= function(router,connection,md5) {
	    router.get("/",function(req,res){
	        res.json({"Message" : "Hello World sss!"});
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
                res.json({"Error" : true, "Message" : "Error executing MySQL query"});
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
	
}

module.exports = REST_ROUTER;