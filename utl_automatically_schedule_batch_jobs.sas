Setting up chron jobs on unix and windows - sheduling batch jobs                                                                    
                                                                                                                                    
   Solutions                                                                                                                        
                                                                                                                                    
       a. Windows                                                                                                                   
       b. Unix                                                                                                                      
                                                                                                                                    
github                                                                                                                              
https://tinyurl.com/y2dsjbbh                                                                                                        
https://github.com/rogerjdeangelis/utl_automatically_schedule_batch_jobs/blob/master/utl_automatically_schedule_batch_jobs.sas      
                                                                                                                                    
Related to                                                                                                                          
SAS Forum                                                                                                                           
https://tinyurl.com/y2bmhalz                                                                                                        
https://communities.sas.com/t5/SAS-Data-Management/How-to-schedule-a-Unix-Linux-shell-script-with-Process-Manager/m-p/590732        
*_                   _                                                                                                              
(_)_ __  _ __  _   _| |_                                                                                                            
| | '_ \| '_ \| | | | __|                                                                                                           
| | | | | |_) | |_| | |_                                                                                                            
|_|_| |_| .__/ \__,_|\__|                                                                                                           
        |_|                                                                                                                         
;                                                                                                                                   
                                                                                                                                    
*                 _           _                                                                                                     
  __ _  __      _(_)_ __   __| | _____      _____                                                                                   
 / _` | \ \ /\ / / | '_ \ / _` |/ _ \ \ /\ / / __|                                                                                  
| (_| |  \ V  V /| | | | | (_| | (_) \ V  V /\__ \                                                                                  
 \__,_|   \_/\_/ |_|_| |_|\__,_|\___/ \_/\_/ |___/                                                                                  
                                                                                                                                    
;                                                                                                                                   
                                                                                                                                    
SCHEDULE                                                                                                                            
========                                                                                                                            
                                                                                                                                    
Run at 2am every monday-friday                                                                                                      
                                                                                                                                    
CODE                                                                                                                                
====                                                                                                                                
                                                                                                                                    
c:\sas\crop.sas                                                                                                                     
                                                                                                                                    
 data crop;                                                                                                                         
   set sashelp.class;                                                                                                               
 run;quit;                                                                                                                          
                                                                                                                                    
                                                                                                                                    
SCHEDULE                                                                                                                            
========                                                                                                                            
                                                                                                                                    
start>Control Panel\System and Security\Administrative Tools\scheduled tasks                                                        
                                                                                                                                    
Mouse surf through a half dozen windows.                                                                                            
Reasonably intuiitive ( circa 2008 - Microsoft may have added additional bling)                                                     
                                                                                                                                    
You end up entering this along with setting time.                                                                                   
                                                                                                                                    
C:\Program Files\SAS\SAS 9.1\sas.exe" -nosplash -sysin c:\sas\crop.sas -log nul: -print nul                                         
                                                                                                                                    
Finally you should see                                                                                                              
Run at 2am every monday-friday                                                                                                      
                                                                                                                                    
*_                    _                                                                                                             
| |__     _   _ _ __ (_)_  __                                                                                                       
| '_ \   | | | | '_ \| \ \/ /                                                                                                       
| |_) |  | |_| | | | | |>  <                                                                                                        
|_.__(_)  \__,_|_| |_|_/_/\_\                                                                                                       
                                                                                                                                    
;                                                                                                                                   
                                                                                                                                    
SCHEDULE                                                                                                                            
========                                                                                                                            
                                                                                                                                    
Run at 2am every monday-friday                                                                                                      
                                                                                                                                    
CODE FILES                                                                                                                          
==========                                                                                                                          
                                                                                                                                    
Need three files                                                                                                                    
                                                                                                                                    
 1. SAS program                                                                                                                     
 2. Time chron file                                                                                                                 
                                                                                                                                    
SAS Program                                                                                                                         
/groundtruth/sas/programs/crop.sas                                                                                                  
data crop;                                                                                                                          
  set sashelp.class;                                                                                                                
run;quit;                                                                                                                           
                                                                                                                                    
Chron file                                                                                                                          
Create single line chron text file                                                                                                  
/var/spool/cron/crontab/{your username}/cronjobs.txt                                                                                
0   2  *  *  1-5 /groundtruth/programs/crop.csh                                                                                     
                                                                                                                                    
Shell file to run sas                                                                                                               
/groundtruth/programs/crop.csh                                                                                                      
#!/usr/bin/csh                                                                                                                      
cd /groundtruth/sas/programs                                                                                                        
/groundtruth/local/bin/sas crop.sas                                                                                                 
                                                                                                                                    
*            _            _                                                                                                         
 _   _ _ __ (_)_  __   __| | ___   ___                                                                                              
| | | | '_ \| \ \/ /  / _` |/ _ \ / __|                                                                                             
| |_| | | | | |>  <  | (_| | (_) | (__                                                                                              
 \__,_|_| |_|_/_/\_\  \__,_|\___/ \___|                                                                                             
                                                                                                                                    
;                                                                                                                                   
                                                                                                                                    
                                                                                                                                    
Time settings 2Am every mon-fri                                                                                                     
                                                                                                                                    
mm hh dd mon day                                                                                                                    
0   2  *  *  1-5                                                                                                                    
                                                                                                                                    
You can execute crontab if your name appears in the file /usr/lib/cron/cron.allow                                                   
                                                                                                                                    
crontab -e  Edit your crontab file, or create one if it doesn?t already exist.                                                      
crontab -l  Display your crontab file.                                                                                              
crontab -r  Remove your crontab file.                                                                                               
crontab -v  Display the last time you edited your crontab file.                                                                     
                                                                                                                                    
                                                                                                                                    
                                                                                                                                    
