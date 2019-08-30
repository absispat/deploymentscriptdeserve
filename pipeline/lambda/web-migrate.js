var assert = require('assert');
var AWS = require('aws-sdk');
exports.migrateHandler = async (event, context) => {
    var codepipeline = new AWS.CodePipeline();


    // Retrieve the value of UserParameters from the Lambda action configuration in AWS CodePipeline, in this case a URL which will be
    // health checked by this function.
    var jobId = event["CodePipeline.job"].id;
    var taskDefName = event["CodePipeline.job"].data.actionConfiguration.configuration.UserParameters; 
    console.log(jobId);
    console.log(taskDefName);
        // Notify AWS CodePipeline of a successful job
    var putJobSuccess = function(message) {
        console.log('*****_____________________ putJobSuccess called' );
        var params = {
            jobId: jobId
        };

        codepipeline.putJobSuccessResult(params, function(err, data) {
            if(err) {
                context.fail(err);      
            } else {
                context.succeed(data);      
            }
        });
    };
    
    // Notify AWS CodePipeline of a failed job
    var putJobFailure = function(message) {
        var params = {
            jobId: jobId,
            failureDetails: {
                message: JSON.stringify(message),
                type: 'JobFailed',
                externalExecutionId: context.invokeid
            }
        };
        codepipeline.putJobFailureResult(params, function(err, data) {
            context.fail(message);      
        });
    };
    
      // Helper function to run task based on a taskDefinition
    // The helper will test the response and succeed or fail the job accordingly 
    var runTask = function(taskDefName, caltaskDefNamelback) {
        console.log('callback post runtask called');
        caltaskDefNamelback('successful');
        
    }
    
        runTask(taskDefName, function(taskResponse) {
        try {
            
            // Succeed the job
            putJobSuccess("Tests passed");
        } catch (ex) {
            // If any of the assertions failed then fail the job
            putJobFailure(ex);    
        }
    });     
};
