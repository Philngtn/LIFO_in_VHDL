-- ************************************************************************
-- Author: Phuc Nguyen
-- Email: philngtn@gmail.com
-- File : FILO_buffer_tb.vhd
-- Design Units:
-- ************************************************************************


library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;


entity FILO_Buffer_tb is
end entity;

architecture testBench of FILO_Buffer_tb is
    
    component FILO_Buffer
      port ( w_data                : in std_logic_vector(15 downto 0);
             push_pop, clk, reset : in std_logic;
             r_data                : out std_logic_vector(15 downto 0);
             full, empty           : out std_logic;
             stk_ptr: out integer
           );
    end component;
    
    
      signal       w_data                : std_logic_vector(15 downto 0);
      signal       push_pop              : std_logic:= '1';
      signal       reset                 : std_logic := '1';
      signal       r_data                : std_logic_vector(15 downto 0);
      signal       full, empty,clk       : std_logic;
      signal       stk_ptr               : integer;
  
    constant clk_period : time := 10 ns;
      
    begin
      
      U1: FILO_Buffer port map ( w_data => w_data, push_pop => push_pop,
                                reset => reset, r_data => r_data, full=>full,
                                empty => empty, clk=>clk, stk_ptr => stk_ptr );
        
      clk_process: process
      
      begin 
        clk <= '0';
        wait for clk_period/2;
        clk <= '1';
        wait for clk_period/2;
      end process;
      
        
      stim_proc: process
      begin
        
      reset <= '0';
      push_pop <= '1';  
      w_data <= std_logic_vector(to_unsigned(36, w_data'length));
      wait for 15 ns;
      
   
      w_data <= std_logic_vector(to_unsigned(212, w_data'length));
      wait for 10 ns;
        
      w_data <= std_logic_vector(to_unsigned(59, w_data'length));
      wait for 10 ns;
    
      w_data <= std_logic_vector(to_unsigned(128, w_data'length));
      push_pop <= '0';
      wait for 10 ns;
      
      reset <= '1';
      wait for 10 ns;
      
      reset <= '0';
      push_pop <= '1'; 
      w_data <= std_logic_vector(to_unsigned(209, w_data'length));
      wait for 10 ns;
      
      w_data <= std_logic_vector(to_unsigned(23, w_data'length));
      wait for 10 ns;
      
      w_data <= std_logic_vector(to_unsigned(7, w_data'length));
      wait for 10 ns;
      
      w_data <= std_logic_vector(to_unsigned(68, w_data'length));
      wait for 10 ns;
      
      push_pop <= '0';
      wait for 30 ns;
      
      push_pop <= '1';
      wait for 10 ns;
      
      w_data <= std_logic_vector(to_unsigned(55, w_data'length));
      wait for 10 ns;
      
      w_data <= std_logic_vector(to_unsigned(12, w_data'length));
      wait for 10 ns;
      
      w_data <= std_logic_vector(to_unsigned(2, w_data'length));
      wait for 10 ns;
      
      w_data <= std_logic_vector(to_unsigned(98, w_data'length));
      wait for 10 ns;
      
      
      push_pop <= '0';
      wait for 50 ns;
      
      
      wait;
      
    end process;
    
  end architecture;
      
        
        
        
