Visit this link: https://www.geeksforgeeks.org/sql-procedures/#modify-procedures-in-plsql


```
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE GetStringLength
    @InputString VARCHAR(100),
    @Length INT OUTPUT
AS
BEGIN
    -- Calculate the length of the string
    SET @Length = LEN(@InputString)
END
GO
```
