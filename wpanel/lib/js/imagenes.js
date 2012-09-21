/* 
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

$(function() {
   var time = new Date().getTime();
			$('#file_upload').uploadifive({
				'auto'             : false,
				'checkScript'      : 'lib/upload/check-exists.php',
				'formData'         : {
									   'timestamp' : time,
									   'token'     : time
				                     },
				'queueID'          : 'queue',
				'uploadScript'     : 'lib/upload/uploadifive.php',
				'onUploadComplete' : function(file, data) { console.log(data); }
			});
		});
