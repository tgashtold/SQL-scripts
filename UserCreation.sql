USE ProgAssistant

CREATE LOGIN DBUser 
    WITH PASSWORD = '12345USERforDB';  
GO  

CREATE USER DBUser FOR LOGIN DBUser;  
GO  