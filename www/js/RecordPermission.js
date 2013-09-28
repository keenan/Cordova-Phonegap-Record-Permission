//
//  RecordPermission.js
//
//  Created by Keenan Wyrobek, September 2013.
//  MIT licensed
//

/*
Call this function like this

recordPermission({
    success: function(answer){
        console.log('permission = '+answer);
    },
    error: function(error){
        console.log('error = '+JSON.stringify(error));
    }
});

*/

 window.recordPermission = function(params) {
     cordova.exec(function(answer){
         if (answer === "True") params.success(true);
         else if (answer === "False") params.success(false);
         else params.error('success called with "'+answer+'". Must be "True" or "False" strings');
     }, params.error,"RecordPermission", "recordPermission");
 };