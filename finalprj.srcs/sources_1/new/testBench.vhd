library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

library work;
use work.myPackage.all;

entity testBench is
--  Port ( );
end testBench;



architecture Behavioral of testBench is
     
    signal CLOCK:std_logic:= '0';
    signal RST, SET_TIME, SET_ALARM, STOP_ALARM, 
           ALARM_ON, CLOCK_ON, ALARM: std_logic;
    signal H_IN1, H_IN0, M_IN1, M_IN0 : unsigned(3 downto 0);
    signal H_OUT1, H_OUT0, M_OUT1, M_OUT0,
           S_OUT1, S_OUT0: std_logic_vector(6 downto 0);
    
begin
    
    RST <= '1', '0' after 1ns;
    
    CLOCK <= not CLOCK after PERIOD/2;
    
    -- test1: simulating input 1
    SET_TIME <=    '0', '0' after 2000 ms, '1' after 3000 ms, '0' after 5000 ms, '0' after 6000 ms;                                                                                                           
    SET_ALARM <=   '0', '0' after 2000 ms, '0' after 3000 ms, '1' after 5000 ms, '0' after 6000 ms;
    STOP_ALARM <=  '0', '0' after 2000 ms, '0' after 3000 ms, '0' after 5000 ms, '0' after 6000 ms;
    ALARM_ON <=    '0', '0' after 2000 ms, '0' after 3000 ms, '0' after 5000 ms, '1' after 6000 ms;
    CLOCK_ON <=    '0', '1' after 2000 ms, '1' after 3000 ms, '1' after 5000 ms, '1' after 6000 ms;
    H_IN1 <=      x"0",x"0" after 2000 ms,x"1" after 3000 ms,x"1" after 5000 ms,x"0" after 6000 ms;
    H_IN0 <=      x"0",x"0" after 2000 ms,x"7" after 3000 ms,x"7" after 5000 ms,x"0" after 6000 ms;
    M_IN1 <=      x"0",x"0" after 2000 ms,x"3" after 3000 ms,x"3" after 5000 ms,x"0" after 6000 ms;
    M_IN0 <=      x"0",x"0" after 2000 ms,x"4" after 3000 ms,x"5" after 5000 ms,x"0" after 6000 ms;
    
    -- test2: simulating input 2
--    SET_TIME <=    '0', '0' after 2000 ms, '1' after 3000 ms, '0' after 5000 ms, '0' after 6000 ms;                                                                                                           
--    SET_ALARM <=   '0', '0' after 2000 ms, '0' after 3000 ms, '1' after 5000 ms, '0' after 6000 ms;
--    STOP_ALARM <=  '0', '0' after 2000 ms, '0' after 3000 ms, '0' after 5000 ms, '0' after 6000 ms;
--    ALARM_ON <=    '0', '0' after 2000 ms, '0' after 3000 ms, '0' after 5000 ms, '1' after 6000 ms;
--    CLOCK_ON <=    '0', '1' after 2000 ms, '1' after 3000 ms, '1' after 5000 ms, '1' after 6000 ms;
--    H_IN1 <=      x"0",x"0" after 2000 ms,x"2" after 3000 ms,x"2" after 5000 ms,x"0" after 6000 ms;
--    H_IN0 <=      x"0",x"0" after 2000 ms,x"1" after 3000 ms,x"1" after 5000 ms,x"0" after 6000 ms;
--    M_IN1 <=      x"0",x"0" after 2000 ms,x"4" after 3000 ms,x"5" after 5000 ms,x"0" after 6000 ms;
--    M_IN0 <=      x"0",x"0" after 2000 ms,x"9" after 3000 ms,x"0" after 5000 ms,x"0" after 6000 ms;
    
    -- test3: simulating input 3
--    SET_TIME <=    '0', '0' after 2000 ms, '1' after 3000 ms, '0' after 5000 ms, '0' after 6000 ms;                                                                                                           
--    SET_ALARM <=   '0', '0' after 2000 ms, '0' after 3000 ms, '1' after 5000 ms, '0' after 6000 ms;
--    STOP_ALARM <=  '0', '0' after 2000 ms, '0' after 3000 ms, '0' after 5000 ms, '0' after 6000 ms;
--    ALARM_ON <=    '0', '0' after 2000 ms, '0' after 3000 ms, '0' after 5000 ms, '1' after 6000 ms;
--    CLOCK_ON <=    '0', '1' after 2000 ms, '1' after 3000 ms, '1' after 5000 ms, '1' after 6000 ms;
--    H_IN1 <=      x"0",x"0" after 2000 ms,x"2" after 3000 ms,x"2" after 5000 ms,x"0" after 6000 ms;
--    H_IN0 <=      x"0",x"0" after 2000 ms,x"0" after 3000 ms,x"1" after 5000 ms,x"0" after 6000 ms;
--    M_IN1 <=      x"0",x"0" after 2000 ms,x"5" after 3000 ms,x"0" after 5000 ms,x"0" after 6000 ms;
--    M_IN0 <=      x"0",x"0" after 2000 ms,x"9" after 3000 ms,x"0" after 5000 ms,x"0" after 6000 ms;
    
    -- test 4
--    SET_TIME <=    '0', '0' after 2000 ms, '1' after 4000 ms, '0' after 5000 ms, '0' after 6000 ms, '0' after 67000 ms;                                                                                                           
--    SET_ALARM <=   '0', '0' after 2000 ms, '0' after 4000 ms, '1' after 5000 ms, '0' after 6000 ms, '0' after 67000 ms;
--    STOP_ALARM <=  '0', '0' after 2000 ms, '0' after 4000 ms, '0' after 5000 ms, '0' after 6000 ms, '1' after 67000 ms;
--    ALARM_ON <=    '0', '0' after 2000 ms, '0' after 4000 ms, '0' after 5000 ms, '1' after 6000 ms, '1' after 67000 ms;
--    CLOCK_ON <=    '0', '1' after 2000 ms, '1' after 4000 ms, '1' after 5000 ms, '1' after 6000 ms, '1' after 67000 ms;
--    H_IN1 <=      x"0",x"0" after 2000 ms,x"1" after 4000 ms,x"1" after 5000 ms,x"0" after 6000 ms,x"0" after 67000 ms;
--    H_IN0 <=      x"0",x"0" after 2000 ms,x"5" after 4000 ms,x"5" after 5000 ms,x"0" after 6000 ms,x"0" after 67000 ms;
--    M_IN1 <=      x"0",x"0" after 2000 ms,x"4" after 4000 ms,x"4" after 5000 ms,x"0" after 6000 ms,x"0" after 67000 ms;
--    M_IN0 <=      x"0",x"0" after 2000 ms,x"2" after 4000 ms,x"3" after 5000 ms,x"0" after 6000 ms,x"0" after 67000 ms;
    
    -- test 5        
--    SET_TIME <=    '0', '0' after 2000 ms, '1' after 4000 ms, '0' after 5000 ms, '0' after 6000 ms, '0' after 123000 ms;                                                                                                           
--    SET_ALARM <=   '0', '0' after 2000 ms, '0' after 4000 ms, '1' after 5000 ms, '0' after 6000 ms, '0' after 123000 ms;
--    STOP_ALARM <=  '0', '0' after 2000 ms, '0' after 4000 ms, '0' after 5000 ms, '0' after 6000 ms, '0' after 123000 ms;
--    ALARM_ON <=    '0', '0' after 2000 ms, '0' after 4000 ms, '0' after 5000 ms, '1' after 6000 ms, '0' after 123000 ms;
--    CLOCK_ON <=    '0', '1' after 2000 ms, '1' after 4000 ms, '1' after 5000 ms, '1' after 6000 ms, '1' after 123000 ms;
--    H_IN1 <=      x"0",x"0" after 2000 ms,x"0" after 4000 ms,x"0" after 5000 ms,x"0" after 6000 ms,x"0" after 123000 ms;
--    H_IN0 <=      x"0",x"0" after 2000 ms,x"1" after 4000 ms,x"1" after 5000 ms,x"0" after 6000 ms,x"0" after 123000 ms;
--    M_IN1 <=      x"0",x"0" after 2000 ms,x"1" after 4000 ms,x"1" after 5000 ms,x"0" after 6000 ms,x"0" after 123000 ms;
--    M_IN0 <=      x"0",x"0" after 2000 ms,x"3" after 4000 ms,x"5" after 5000 ms,x"0" after 6000 ms,x"0" after 123000 ms;

    -- test 6
--    SET_TIME <=    '0', '0' after 2000 ms, '1' after 4000 ms, '0' after 5000 ms, '1' after 110000 ms, '0' after 111000 ms;                                                                                                           
--    SET_ALARM <=   '0', '0' after 2000 ms, '0' after 4000 ms, '0' after 5000 ms, '0' after 110000 ms, '0' after 111000 ms;
--    STOP_ALARM <=  '0', '0' after 2000 ms, '0' after 4000 ms, '0' after 5000 ms, '0' after 110000 ms, '0' after 111000 ms;
--    ALARM_ON <=    '0', '0' after 2000 ms, '0' after 4000 ms, '0' after 5000 ms, '0' after 110000 ms, '0' after 111000 ms;
--    CLOCK_ON <=    '0', '1' after 2000 ms, '1' after 4000 ms, '1' after 5000 ms, '1' after 110000 ms, '1' after 111000 ms;
--    H_IN1 <=      x"0",x"0" after 2000 ms,x"0" after 4000 ms,x"0" after 5000 ms,x"1" after 110000 ms,x"0" after 111000 ms;
--    H_IN0 <=      x"0",x"0" after 2000 ms,x"2" after 4000 ms,x"0" after 5000 ms,x"7" after 110000 ms,x"0" after 111000 ms;
--    M_IN1 <=      x"0",x"0" after 2000 ms,x"4" after 4000 ms,x"0" after 5000 ms,x"5" after 110000 ms,x"0" after 111000 ms;
--    M_IN0 <=      x"0",x"0" after 2000 ms,x"7" after 4000 ms,x"0" after 5000 ms,x"2" after 110000 ms,x"0" after 111000 ms;
    

    REL: BUZZERCLOCK port map(RESET => RST,
                              CLK => CLOCK,
                              SET_TIME => SET_TIME,
                              SET_ALARM => SET_ALARM,
                              STOP_ALARM =>STOP_ALARM,
                              ALARM_ON => ALARM_ON,
                              CLOCK_ON => CLOCK_ON,
                              H_IN1 => H_IN1,
                              H_IN0 => H_IN0,
                              M_IN1 => M_IN1,
                              M_IN0 => M_IN0,
                              ALARM => ALARM,
                              H_OUT1 => H_OUT1,
                              H_OUT0 => H_OUT0,
                              M_OUT1 => M_OUT1,
                              M_OUT0 => M_OUT0,
                              S_OUT1 => S_OUT1,
                              S_OUT0 => S_OUT0
                              ); 



end Behavioral;