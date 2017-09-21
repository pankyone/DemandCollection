 function isName(obj)
 { 
	 reg=/^([\u4E00-\u9FA5]{2,15})$/g;
	 if((!reg.test(obj))&&(obj!="")){   
         alert("请输入正确的机构名称");
     }
	 else{    
     }   
 }
 function isAddress(obj)
 {
	 reg1=/^[A-Za-z0-9]+$/;
	 reg2=/^[\u4e00-\u9fa5]+$/;
	 if((!reg1.test(obj))&&(!reg2.test(obj))&&(obj!="")){        
         alert("请输入正确的通讯地址");
     }
	 else{    
     } 
 }
 function isUri(obj){   
     reg=/^http:\/\/[a-zA-Z0-9]+\.[a-zA-Z0-9]+[\/=\?%\-&_~`@[\]\':+!]*([^<>\"\"])*$/;   
     if((!reg.test(obj))&&(obj!="")){   
     	alert("请输入正确的inernet地址");   
     }
     else{    
     }   
 }
    function isEmail(obj){   
        reg=/^\w{3,}@\w+(\.\w+)+$/;   
        if((!reg.test(obj))&&(obj!="")){        
            alert("请输入正确的邮箱地址");   
        }
        else{   
              
        }   
    }
    function isPeopleName(obj)
    {
    	reg=/^([\u4E00-\u9FA5]{2,6})$/g;
   	 	if((!reg.test(obj))&&(obj!="")){        
            alert("请输入正确的姓名");
        }
   	 	else
        {    
        }    	
    }
    function isPostalCode(obj)
    {
    	reg=/[1-9][0-9]{0,5}/;
    	if((!reg.test(obj))&&(obj!="")){        
            alert("请输入正确邮政编码");
        }
    	else{    
        }
    }
 
    function isMobile(obj){   
        reg=/^(\+\d{2,3}\-)?\d{11}$/;
        reg1=/^(\d{3,4}\-)?[1-9]\d{6,7}$/;
        if((!reg.test(obj))&&(!reg1.test(obj))&&(obj!="")){   
        	alert("请输入正确的电话号码或手机号！");   
        }
        else{    
        }   
    }
    function isFax(obj)
    {
    	reg=/^[+]{0,1}(\d){1,3}[ ]?([-]?((\d)|[ ]){1,12})+$/;
    	if((!reg.test(obj))&&(obj!="")){   
        	alert("请输入正确的传真号");   
        }
    	else{      
        }  
    }
    function isDepartment(obj)
    {
    	reg=/^([\u4E00-\u9FA5]{2,15})$/g;
   	 	if((!reg.test(obj))&&(obj!="")){        
            alert("请输入正确的归口管理部门");
        }
   	 	else{    
        } 
    }
    function isNeedname(obj)
    {
    	reg=/^([\u4E00-\u9FA5]{2,15})$/g;
   	 	if((!reg.test(obj))&&(obj!="")){        
            alert("请输入正确的技术需求名称");
        }
   	 	else{    
        } 
    }
    function isKeywords(obj)
    {
    	reg1=/^[A-Za-z0-9]+$/;
    	reg2=/^([\u4E00-\u9FA5]{2,5})$/g;
   	 	if((!reg1.test(obj))&&(!reg2.test(obj))&&(obj!="")){        
            alert("请输入正确的关键字");
        }
   	 	else{    
        } 
    }
    function isInstruction(obj)
    {
    	reg1=/^[A-Za-z0-9]+$/;
    	reg2=/^([\u4E00-\u9FA5]{0,25})$/g;
   	 	if((!reg1.test(obj))&&(!reg2.test(obj))&&(obj!="")){        
            alert("请输入正确的注明内容");
        }
   	 	else{    
        } 
    }
    function isNumber(obj)
    {
    	reg=/^[1-9][0-9]*(\.\d+)?$/; 
    	reg1=/^0(\.\d+)?$/;
        if((!reg.test(obj))&&(!reg1.test(obj))&&(obj!="")){   
        	alert("请输入正确的金额");   
        }
        else{      
        }   
    }
    function isString(obj){   
        reg=/^[a-z,A-Z]+$/;   
        if((!reg.test(obj))&&(obj!="")){   
        	alert("只能输入字符");   
        }
        else{      
        }   
    }  
    function isInteger(obj){   
    	
        reg=/^[-+]?\d+$/;    
        if(!reg.test(obj)){   
        	alert("Please input correct figures");   
        }else{     
        }   
    } 
    