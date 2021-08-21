library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.NUMERIC_STD.ALL;


package MyPackage is
    
    constant frequency: integer:= 125;
    constant PERIOD: time:= 8 ms;
    
    component BUZZERCLOCK is
        port(RESET, CLK, SET_TIME, SET_ALARM, STOP_ALARM, ALARM_ON, CLOCK_ON:in std_logic; 
             H_IN1, H_IN0, M_IN1, M_IN0 :in  unsigned(3 downto 0);
             ALARM:out std_logic;
             H_OUT1, H_OUT0, M_OUT1, M_OUT0, S_OUT1, S_OUT0:out std_logic_vector(6 downto 0) 
             );
    end component;
    
    function INT_TO_7SEG( BCD: integer := 0)
    return std_logic_vector;
    
    function TIME_IN_SECONDS(HOURS, MINUTES, SECONDS: integer)
    return integer;
    
    
end package MyPackage;   





package body myPackage is
    
    function INT_TO_7SEG( BCD: integer := 0)
    return std_logic_vector is
        variable RESULT: std_logic_vector(6 downto 0);
    begin
        case BCD is
            when 0 =>        
                RESULT:= b"0000001"; -- 0
            when 1 =>        
                RESULT:= b"1001111"; -- 1
            when 2 =>        
                RESULT:= b"0010010"; -- 2
            when 3 =>        
                RESULT:= b"0000110"; -- 3
            when 4 =>        
                RESULT:= b"1001100"; -- 4
            when 5 =>        
                RESULT:= b"0100100"; -- 5
            when 6 =>        
                RESULT:= b"0100000"; -- 6
            when 7 =>        
                RESULT:= b"0001111"; -- 7
            when 8 =>        
                RESULT:= b"0000000"; -- 8
            when 9 =>        
                RESULT:= b"0000100"; -- 9
            when others =>            -- un_acceptable for a digit
                RESULT:= b"1111111";
        end case;
        return RESULT;
    end function;
    
    
    
    function TIME_IN_SECONDS(HOURS, MINUTES, SECONDS: integer)
    return integer is
        variable RESULT: integer;
    begin
        if(HOURS > 23 or MINUTES > 59 or SECONDS > 59) then
            RESULT := -1;
        elsif(HOURS < 0 or MINUTES < 0 or SECONDS < 0) then
            RESULT := -1;  
        else 
            RESULT := (HOURS * 3600) + (MINUTES * 60) + SECONDS;       
        end if;
        
        return RESULT;
    end function;


end package body myPackage;