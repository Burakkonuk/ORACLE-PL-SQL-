REM   Script: isPowerOfThree
REM   isPowerOfThree

CREATE OR REPLACE FUNCTION isPowerOfThree(numberx IN OUT NUMBER) 
RETURN STRING IS returnx STRING(10); 
init NUMBER; 
ans NUMBER; 
BEGIN 
ans := 0; 
if (numberx = 0) THEN 
    return 'False'; 
END IF; 
 
init := LOG(3,numberx); 
DBMS_OUTPUT.PUT_LINE(init); 
IF(SUBSTR(init,3,10) = 9999999999) THEN -- I HAVE OBSERVED THE SOLUTION SET THAT I CONCLUDED THAT BIGGER POWERS OF 3 IS NOT COMPUTABLE BY THE LOG FUNCTION FOR INSTANCE; 27 IS THE 2.9999999999th POWER OF THE 3.THUS I TRACKED THE 10 DIGITS AFTER POINT AND IF IT EQUALS 999.. IT IS CEILED TO DE UPPER INTEGER 
    init:=CEIL(init); 
    DBMS_OUTPUT.PUT_LINE(init); 
ELSIF (SUBSTR(init,4,15) = 999999999999999) THEN -- IF THE POWER IS BIGGER THAN 10 HOWEVER DECIMAL NUMBER IS 2 DIGITS I NEEDED TO TRACK THE NUMBERS AFTER 4 AND WHEN THE NUMBER GOES BIG THE FRACTIONAL PART OF THE NUMBER WILL BE CLOSER TO NUMBER EVEN IF IT IS NOT THE POWER OF THE THREE SO I USED 15 999. DIGITS TO ADJUST THE CODE 
    init:=CEIL(init); 
END IF; 
 
IF (mod(init,1) = 0) THEN 
    return 'True'; 
ELSE  
    return 'False'; 
END IF; 
 
 
return ans; 
END; 
 

/

DECLARE 
numberx NUMBER; 
 
BEGIN 
 
numberx :=  617673396283947; 
DBMS_OUTPUT.PUT_LINE(isPowerOfThree(numberx)); 
 EXCEPTION 
    WHEN VALUE_ERROR THEN
    dbms_output.put_line('Please enter an integer'); 
END;
/

