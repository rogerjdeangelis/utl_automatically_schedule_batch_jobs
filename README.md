# utl_automatically_schedule_batch_jobs
Automatically schedule batch jobs in unix and window environments

    ```  Setting up chron jobs on unix and windows                                                                                                                    ```
    ```                                                                                                                                                               ```
    ```  Consider a drop down Python to crop a png image script from SAS                                                                                              ```
    ```                                                                                                                                                               ```
    ```  * located in /sas/crop.sas                                                                                                                                   ```
    ```                                                                                                                                                               ```
    ```  %utl_submit_py64('                                                                                                                                           ```
    ```      from PIL import Image;                                                                                                                                   ```
    ```      img = Image.open("d:/png/utl_crop.png");                                                                                                                 ```
    ```      img2 = img.crop((300,300,700,700));                                                                                                                      ```
    ```      img2.save("d:/png/utl_cropped.png");                                                                                                                     ```
    ```  ');                                                                                                                                                          ```
    ```                                                                                                                                                               ```
    ```  *         _           _                                                                                                                                      ```
    ```  __      _(_)_ __   __| | _____      _____                                                                                                                    ```
    ```  \ \ /\ / / | '_ \ / _` |/ _ \ \ /\ / / __|                                                                                                                   ```
    ```   \ V  V /| | | | | (_| | (_) \ V  V /\__ \                                                                                                                   ```
    ```    \_/\_/ |_|_| |_|\__,_|\___/ \_/\_/ |___/                                                                                                                   ```
    ```                                                                                                                                                               ```
    ```  ;                                                                                                                                                            ```
    ```                                                                                                                                                               ```
    ```  This is a very old tip circa Win 2000(updated today for Win 7)                                                                                               ```
    ```                                                                                                                                                               ```
    ```  start>Control Panel\System and Security\Administrative Tools\scheduled tasks                                                                                 ```
    ```                                                                                                                                                               ```
    ```  put the following in run dialog box                                                                                                                          ```
    ```  C:\Program Files\SAS\SAS 9.1\sas.exe" -nosplash -sysin c:\sas\crop.sas -log nul: -print nul:                                                                 ```
    ```  put the following in start in box                                                                                                                            ```
    ```  c:\sas                                                                                                                                                       ```
    ```                                                                                                                                                               ```
    ```  You don't have to have a null log and list.                                                                                                                  ```
    ```  I send an email with the log and list when the program fails                                                                                                 ```
    ```                                                                                                                                                               ```
    ```  *            _                                                                                                                                               ```
    ```   _   _ _ __ (_)_  __                                                                                                                                         ```
    ```  | | | | '_ \| \ \/ /                                                                                                                                         ```
    ```  | |_| | | | | |>  <                                                                                                                                          ```
    ```   \__,_|_| |_|_/_/\_\                                                                                                                                         ```
    ```                                                                                                                                                               ```
    ```  ;                                                                                                                                                            ```
    ```                                                                                                                                                               ```
    ```  create a file called cronjob.txt with just the line below                                                                                                    ```
    ```                                                                                                                                                               ```
    ```  0 2 * * 1-5 /groundtruth/programs/program.csh                                                                                                                ```
    ```                                                                                                                                                               ```
    ```  Details                                                                                                                                                      ```
    ```  mm hh dd mon day                                                                                                                                             ```
    ```  0   2  *  *  1-5 /groundtruth/programs/program.csh                                                                                                           ```
    ```                                                                                                                                                               ```
    ```  run at 2am every monday-friday                                                                                                                               ```
    ```                                                                                                                                                               ```
    ```  here is what program.csh looks like(executes sas myprogram                                                                                                   ```
    ```  #!/usr/bin/csh                                                                                                                                               ```
    ```  cd /groundtruth/sas/programs                                                                                                                                 ```
    ```  /groundtruth/local/bin/sas mysasprogram                                                                                                                      ```
    ```                                                                                                                                                               ```
    ```  You can execute crontab if your name appears in the file /usr/lib/cron/cron.allow                                                                            ```
    ```                                                                                                                                                               ```
    ```  crontab -e      Edit your crontab file, or create one if it doesn?t already exist.                                                                           ```
    ```  crontab -l      Display your crontab file.                                                                                                                   ```
    ```  crontab -r      Remove your crontab file.                                                                                                                    ```
    ```  crontab -v      Display the last time you edited your crontab file.                                                                                          ```
    ```                                                                                                                                                               ```

